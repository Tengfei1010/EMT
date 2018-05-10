#!/usr/bin/python
# -*- coding: utf-8 -*-

from __future__ import print_function

import argparse
import ConfigParser
import io
import os


dir_path = os.path.dirname(os.path.realpath(__file__))
source_dir = os.path.join(dir_path, 'src')
output_dir = os.path.join(dir_path, 'test')


def _print_usage():
    m, n = 10, 10
    for i in range(m):
        for j in range(n):
            print('*' if i in [0, n-1] or j in [0, m-1] else ' ', end='')
        print()


def _generate_output(source_code):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    return os.path.join(output_dir, source_code + '.bc')


def read_config():
    # Load the configuration file
    with open("./config.ini") as f:
        sample_config = f.read()
    config = ConfigParser.RawConfigParser(allow_no_value=True)
    config.readfp(io.BytesIO(sample_config))
    return config


def parse_args():

    parser = argparse.ArgumentParser()

    parser.add_argument("-s", "--source", help="source code",
                        type=str)
    parser.add_argument("-k", "--klee", help="run klee", type=int,
                        default=0)
    parser.add_argument("-l", "--solver", help="background constraint solve",
                        type=str, default="z3")

    args = parser.parse_args()

    if not args.source:
        assert "Must input a source code file!" == 1

    if args.klee:
        print("You select to run klee!")

        if args.solver:
            print("klee will use z3 solver!")

    return args


def make_source_to_bc(config, source_code, output_bc):

    cmd = [config.get('llvm', 'CC'), ' -I ',
           config.get('klee', 'include'), ' ',
           config.get('flags', 'default'),
           ' -c -g ', source_code, ' -o ', output_bc]

    os.system(''.join(cmd))


def run_klee(config, args, output_bc):
    if not os.path.exists(output_bc):
        assert "Input bc is not exists!" == 1

    cmd = [
        config.get('klee', 'exe'), ' ',
        config.get('flags', 'klee_solver'), '=', args.solver, ' ',
        output_bc]

    os.system(''.join(cmd))


def main():
    _print_usage()

    args = parse_args()
    config = read_config()

    output_bc = _generate_output(args.source)
    source_code = os.path.join(source_dir, args.source)

    make_source_to_bc(config, source_code, output_bc)

    if args.klee:
        run_klee(config, args, output_bc)


if __name__ == '__main__':
    main()
