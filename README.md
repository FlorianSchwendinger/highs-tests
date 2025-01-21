# highs-tests
Some Test Scripts and Optimizion Problems for the HiGHS Solver
to reproduce errors shown up in CRANs checks.

## Folder structure
```
.
├── docker-san
│   ├── Dockerfile
│   ├── README.md
│   └── Taskfile.yml
├── lp
│   ├── distmatch_1.lp
│   └── matchit_1.lp
├── output
│   └── lp-san_2025-01-21
│       ├── distmatch_1.lp.out
│       └── matchit_1.lp.out
├── README.md
└── run_tests.sh

5 directories, 8 files
```

- `docker-san` contains a
    + `Dockerfile` to create a build environment similar to the[`gcc-UBSAN`](https://cran.r-project.org/web/checks/check_issue_kinds.html) tests, a

    + `README.md` to dockument the **docker** / **podman** build process and

    + `Taskfile.yml` so I don't have to type so much.

- `lp` contains model files created with `highs.writeModel`.

- `run_tests.sh` to be used inside the docker to run the tests.


## Run gcc-UBSAN tests
1. Follow the instructions in `docker-san/README.md` to start the docker.
2. Inside the docker go to the tests folder and run the tests the output
   should appear in the folder you specified when starting the docker.

```sh
cd $HOME/highs-tests
bash run_tests.sh
```

