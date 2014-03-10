from fabric.api import task, local


@task
def deploy(version):
    # local("grunt build")
    # local("git branch -D gh-pages")
    # local("git checkout --orphan gh-pages")
    # local("git reset")
    # local("git add -u dist")
    # local("git add .gitignore")
    # local("git clean -df")
    # local("mv dist/* .")
    local("git add .")
    local("git commit -m '%s'" % version)
    local("git push origin gh-pages")
    local("git checkout master")
