from __future__ import (absolute_import, division,
                        print_function, unicode_literals)

import chalk

import os
import sys
import shutil
import distutils.dir_util

PY3 = (sys.version_info >= (3, 0))
HOME = os.environ['HOME']

if not PY3:
    input = raw_input


def prompt_yes_no(question):
    "Ask user question confirming action to be taken"
    valid = {'yes': True, 'y': True,
             'no': False, 'n': False}

    while True:
        print(question, end=' ')
        answer = input().lower()

        if (answer == 'yes') or (answer == 'y'):
            return True
        elif (answer == 'no') or (answer == 'n'):
            return False
        else:
            print('Please answer yes or no.')

def copy_dir_contents(src, dst, ignore=None):
    "Copies all folders and files under src directory to dst"
    for f in os.listdir(src):
        if f == 'letsgo.py':
            continue

        fpath = os.path.join(os.getcwd(), f)
        dst_path = os.path.join(dst, f)

        if os.path.isdir(fpath):
            if os.path.exists(dst_path):
                shutil.rmtree(dst_path)
            chalk.green("Copying '{0}' and its contents".format(f))
            shutil.copytree(fpath, dst_path)
        else:
            chalk.green("Copying file '{0}'".format(f))
            shutil.copy(fpath, dst)

if __name__ == '__main__':
    chalk.white("Copying contents of '{0}' to '{1}'...".format(os.getcwd(), HOME))
    copy_dir_contents(os.getcwd(), HOME)
    chalk.white("Setup complete, best of luck!")

