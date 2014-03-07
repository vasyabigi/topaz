from collections import OrderedDict


def get_choices_with_users(choices, answers):
        """
            Helper function.
            Returns dict like:
                      {'A': ['U1', 'U2', 'U3'],
                       'B': ['U1', 'U2', 'U3'],
                       'C': ['U1', 'U2']
                      }
        """
        choices_with_users = {}
        for choice in choices:
            choices_with_users[choice] = set()
            for user, answer in answers.items():
                for choice_set in answer:
                    if choice in choice_set:
                        choices_with_users[choice].add(user)
                        # now we know, that user evaluated current choice!
                        continue
        return choices_with_users


def vote_ranking(choices, answers):
    """
        In this variant, every user must level-rank all choices.
    """
    final_ranking = {}
    for choice in choices:
        final_ranking[choice] = 0
        for user, answer in answers.items():
            for i, choice_set in enumerate(answer):
                if choice in choice_set:
                    better_part = answer[:i]
                    num_of_losses = 0
                    for s in better_part:
                        num_of_losses += len(s)
                    final_ranking[choice] += num_of_losses
    final_ranking = OrderedDict(sorted(final_ranking.items(),
                                key=lambda t: t[1]))
    return final_ranking
