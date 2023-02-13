{ name = "my-project"
, dependencies = [ "foldable-traversable", "maybe", "prelude" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, backend = "purenix"
}