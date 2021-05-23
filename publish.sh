#!/bin/bash
function is_int() { return $(test "$@" -eq "$@" > /dev/null 2>&1); }
ssh-add -D
git init
git config --global --unset user.name
git config --global --unset user.email
git config user.name "0187773933"
git config user.email "collincerbus@student.olympic.edu"
ssh-add -k /Users/morpheous/.ssh/githubWinStitch

LastCommit=$(git log -1 --pretty="%B" | xargs)
# https://stackoverflow.com/a/3626205
if $(is_int "${LastCommit}");
    then
    NextCommitNumber=$((LastCommit+1))
else
   echo "Not an integer Resetting"
   NextCommitNumber=1
fi
git add .
git commit -m "$NextCommitNumber"
git remote add origin git@github.com:0187773933/stsutility.git
gitresult=$(git push origin master | tail -1)
echo $gitresult

# currentversion=$(head -2 setup.py | tail -1 | awk -F "'" '{print $2}' | awk -F '.' '{print $3}')
# echo $currentversion
# currentversion=$((currentversion+1))
# echo $currentversion
# echo "import setuptools
# VERSION='0.0.$currentversion'
# setuptools.setup(
# 	name='stsutility',
# 	version=VERSION,
# 	author='636',
# 	author_email='win.stitch.23@gmail.com',
# 	description='636 Utility Package',
# 	url='https://github.com/0187773933/stsutility',
# 	packages=setuptools.find_packages(),
# 	classifiers=[
# 		'Programming Language :: Python :: 3',
# 		'License :: OSI Approved :: MIT License',
# 	    'Operating System :: OS Independent',
# 	],
# 	python_requires='>=3.6',
# 	setup_requires=['numpy','pandas','Pint'],
# 	install_requires=[
# 		'json',
# 		'pathlib',
# 		'time',
# 		'Pint',
# 		'math',
# 		'decimal',
# 		'operator',
# 		'pandas',
# 		'numpy',
# 		'pprint',
# 	],
# )
# " > setup.py
# rm -rf build
# rm -rf dist
# python3 setup.py sdist bdist_wheel
# #python3 -m twine upload --repository-url https://upload.pypi.org/legacy/ dist/*
# python3 -m twine upload dist/*