Purpose
=======

Elegant way to share config files between my Linux computers.

In a nutshell, my whole home directory is in a *bare* git repo. Then I can add
selected files using::

  conf add a_config_file

Send them to github repo using::

  conf commit -m "tweaked something in my vim config"
  conf push origin master

The technique is described on this page:

https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

later, I can retrieve the modified files with::

  conf pull

and the original idea comes from **Hacker News**: https://news.ycombinator.com/item?id=11070797
