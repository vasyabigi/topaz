from unittest import TestCase, main

from collections import OrderedDict

from choice_algorithm import get_choices_with_users
from choice_algorithm import vote_ranking


class TestAlgorithm(TestCase):
    def setUp(self):
        self.CHOICES = ['A', 'B', 'C']
        self.USERS = ['U1', 'U2', 'U3']
        self.ANSWERS = {'U1': [set(['A', 'B']), set(['C'])],
                        'U2': [set(['A']), set(['B']), set(['C'])],
                        'U3': [set(['A', 'C']), set(['B'])]}

    def test_get_choices_with_users(self):
        correct = {'A': set(['U1', 'U2', 'U3']),
                   'B': set(['U1', 'U2', 'U3']),
                   'C': set(['U1', 'U2', 'U3'])}
        test = get_choices_with_users(self.CHOICES, self.ANSWERS)
        for correct_users, test_users in zip(correct, test):
            self.assertSequenceEqual(correct_users, test_users)

    def test_vote_ranking(self):
        correct = {}
        correct['A'] = 0
        correct['B'] = 3
        correct['C'] = 4
        correct = OrderedDict(sorted(correct.items(), key=lambda t: t[1]))
        test = vote_ranking(self.CHOICES, self.ANSWERS)
        self.assertSequenceEqual(correct.keys(), test.keys())

if __name__ == '__main__':
    main()
