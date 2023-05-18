# With Saxon extension functions

[CoffeeSacks](https://coffeesacks.nineml.org) is a set of Saxon extension functions.
These functions work with Saxon 10.x or later.

## From the command line

1. Download the latest Saxon release.
2. Download the latest releases of
   [CoffeeGrinder](https://github.com/nineml/coffeegrinder/releases),
   [CoffeeFilter](https://github.com/nineml/coffeefilter/releases), and
   [CoffeeSacks](https://github.com/nineml/coffeesacks/releases).
3. Setup the Java classpath so that all of the relevant jars are available.
4. Run `net.sf.saxon.Transform` with the `-init:org.nineml.coffeesacks.RegisterCoffeeSacks`
   option to initialize the extension functions.

More complete [documentation](https://coffeesacks.nineml.org) is available.

## Demo

The `download-jars.sh` shell script will attempt to download all of the libraries.

```
sh ./download-jars.sh
```

The `run-saxon.sh` shell script will run an example Saxon transformation if you unpack
all of the relevant jar files in the current and/or `lib` directories. (That’s what the
download script does.)

```
sh ./run-saxon.sh
```

Should print the result:

```
<doc>
  <date>
    <day>15</day>
    <month>February</month>
    <year>2022</year>
  </date>
</doc>
```
