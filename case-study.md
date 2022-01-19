# Homework 4

Написать спеки и тесты для любой из решенных задач на execrcism.org, добиться чистоты выполнения
```elixir
mix do dialyzer,credo,test
```

## Шаг 1

Я решил взять свою задачку с [рациональными числами](https://exercism.org/tracks/elixir/exercises/rational-numbers/solutions/AgeevAndrew) скопировав as is

## Шаг 2

Для начала я подключил dialyzer, воспользовавшись [инструкцией](https://github.com/jeremyjh/dialyxir/wiki/Phoenix-Dialyxir-Quickstart)

```shell
 mix dialyzer
Finding suitable PLTs
Checking PLT...
Dialyxir has deprecated plt_add_deps: :transitive in favor of app_tree, which includes only runtime dependencies.
[:compiler, :dialyxir, :elixir, :erlex, :kernel, :logger, :stdlib]
PLT is up to date!
No :ignore_warnings opt specified in mix.exs and default does not exist.

Starting Dialyzer
[
  check_plt: false,
  init_plt: '/Users/andrew/projects/elixir_capstone_project/_build/dev/dialyxir_erlang-24.1.5_elixir-1.12.3_deps-dev.plt',
  files: ['/Users/andrew/projects/elixir_capstone_project/_build/dev/lib/elixir_capstone_project/ebin/Elixir.CapstoneProject.beam'],
  warnings: [:unknown]
]
Total errors: 0, Skipped: 0, Unnecessary Skips: 0
done in 0m0.5s
done (passed successfully)
```

Вроде бы все сразу хорошо.

## Шаг 3

Установил `credo` воспользовавшисть [инструкцией](https://github.com/rrrene/credo)

Запустил и сразу получил предложение по рефакторингу. Круто!
```shell
$ mix credo
  Refactoring opportunities                                                                                                                                                 
┃ 
┃ [F] → Cond statements should contain at least two conditions besides `true`, consider using `if` instead.
┃       lib/capstone_project.ex:83:5 #(CapstoneProject.reduce)

Please report incorrect results: https://github.com/rrrene/credo/issues

Analysis took 0.00 seconds (0.00s to load, 0.00s running 52 checks on 3 files)
10 mods/funs, found 1 refactoring opportunity.

Showing priority issues: ↑ ↗ →  (use `mix credo explain` to explain issues, `mix credo --help` for options).
```

Отрефакторил, воспользовавшись предложением, все прошло без проблем.

## Шаг 4

Написал тесты.

```shell
$ mix test
....................................

Finished in 0.09 seconds (0.00s async, 0.09s sync)
36 tests, 0 failures
```
