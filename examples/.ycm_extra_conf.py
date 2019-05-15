import os
import re


def get_paths():
    zopepy_path = os.path.join(os.getcwd(), 'bin/zopepy')

    if os.path.exists(zopepy_path):
        with open(zopepy_path) as zopepy:
            next_lines = False
            for line in zopepy.readlines():
                if line.strip() == ']':
                    break

                if next_lines:
                    yield re.sub('[\',\s]', '', line)

                if 'sys.path[0:0]' in line:
                    next_lines = True

    else:
        return []


def Settings(**kwargs):
    paths = ['/Users/busykoala/.pyenv/versions/2.7.15/envs/plone_init/lib/python2.7']
    paths.extend(get_paths())

    return {
        'interpreter_path': '/Users/busykoala/.pyenv/versions/2.7.15/envs/plone_init/bin/python',
        'sys_path': paths,
    }
