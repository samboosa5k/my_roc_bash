app [main] { pf: platform "../dependencies/basic-cli/platform/main.roc" }

import pf.Stdout

# MAIN

main =
    Stdout.line! "Please look at this nice menu below :D"
    Stdout.line! (toIndexedOutputStr options)

# HELPERS
MenuOption : (
    Str,
    Action,
)

toIndexedOutputStr : List MenuOption -> Str
toIndexedOutputStr = \menuOptionList ->
    indexMapped =
        List.mapWithIndex
            menuOptionList
            (\(label, _), index ->
                "$(Num.toStr index) $(label)")

    Str.joinWith indexMapped "\n"

# The menu

Action : [Init, NoOp, Echo, Quit]

options : List MenuOption
options = [
    ("init", Init),
    ("echo", Echo),
    ("exit", Quit),
]

# menuRecord = {
#     selection: NoOp,
#     options: Dict.fromList options,
# }

