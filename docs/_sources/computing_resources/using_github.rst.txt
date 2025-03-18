============
Using GitHub 
============

.. contents::
    :local:

This information and lots more can be found on 
`GitHub's website<https://docs.github.com/en/get-started/start-your-journey/hello-world>`_.

! Please add to this if you have extra insight!!!! 


Saving Work/Progress with GitHub 
********************************

Here's a common problem you may run into: you start working on a
cool new idea on a local computing resource. As things start to
fall into place, you copy the directory over to another cluster
resource, and do some work there, perhaps training a model or
running calculations. You end up changing stuff. A week later,
you want to revert those changes... if only you had used some
sort of version control in the first place!

Solution:
This assumes that you are using "main" as the default branch.
If you're using "master", simply substitute it everywhere you
see "main"

1. Set up a git repo from your local computer normally, and push
   your local computer changes to a new github repo.
2. From the HPC machine, run

   .. code:: shell

    git init
    git remote add origin ~~Your new repo's git file~~
    git fetch
    git reset origin/main
    git checkout -t origin/main

   The reset line fixes conflicts with versioned files that
   existed in the directory prior to git init. The last line may
   fail depending on git version - this shouldn't matter for
   current git versions.

3. Commit and push the changes to overwrite the local machine
   files with the HPC files as you choose!
