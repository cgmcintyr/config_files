from __future__ import (absolute_import, division,
                        print_function, unicode_literals)

import chalk

import os
import sys
import shutil
import distutils.dir_util

HOME = os.environ['HOME']

IGNORE = (
    '.git', 'letsgo.py', '.gitignore', '.gitmodules', 'README.md', 'bash.bashrc'
)


def copy_dir_contents(src, dst, ignore=IGNORE):
    "Copies all folders and files under src directory to dst"
    for f in os.listdir(src):
        if f in ignore:
            chalk.yellow("Ignoring {0}".format(f))
            continue

        fpath = os.path.join(src, f)
        dst_path = os.path.join(dst, f)

        if os.path.isdir(fpath):
            if not os.path.exists(dst_path):
                os.mkdir(dst_path)
            chalk.green("Copying '{0}' and its contents to '{1}'".format(f, dst))
            copy_dir_contents(fpath, dst_path, ignore)
        else:
            chalk.green("Copying file '{0}' to '{1}'".format(f, dst))
            shutil.copy(fpath, dst)


if __name__ == '__main__':
    chalk.white("Copying contents of '{0}' to '{1}'...".format(os.getcwd(), HOME))
    copy_dir_contents(os.getcwd(), HOME)
    chalk.white("Setup complete, best of luck!")

