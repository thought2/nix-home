{ name = "my-project"
, dependencies = [ "foldable-traversable", "maybe", "prelude", "unsafe-coerce" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, backend = "purenix"
}
