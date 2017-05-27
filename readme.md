# Sample dancer2 application App::Panda::Manager

## Installation

```
cpanm --installdeps --skip-satisfied .
plackup -r bin/app.psgi
```

## Working with the pandas

### Create new panda

```
http --json --form --style monokai ":5000/panda" name=Oswald description="The cutest of all"
```

### Get panda info

```
http --style monokai ":5000/panda/ruppert"
```

### Kill panda

```
http --style monokai DELETE ":5000/panda/ruppert"
```

### Mutate panda

```
http --json --form --style monokai PUT ":5000/panda/ruppert" description="The real rockstar!"
```

## See also

[Dancer quickstart](http://perldancer.org/quickstart)

