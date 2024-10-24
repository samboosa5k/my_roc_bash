app [main] { pf: platform "../dependencies/basic-cli/platform/main.roc" }

import pf.Stdin
import pf.Stdout

main =
    Stdout.line! "Enter text to count characters:"

    Task.loop {} tick

tick : {} -> Task [Step {}, Done {}] _
tick = \{} ->
    when Stdin.line |> Task.result! is
        Ok str ->
            Stdout.line! (echo str)
            Task.ok (Step {})

        Err (StdinErr EndOfFile) ->
            Stdout.line! (echo "Received end of input (EOF).")
            Task.ok (Done {})

        Err (StdinErr err) ->
            Stdout.line! (echo "Unable to read input $(Inspect.toStr err)")
            Task.ok (Done {})

echo : Str -> Str
echo = \inputStr ->
    Str.joinWith
        [
            Str.concat "Input:" inputStr,
            Str.concat "Input length:" (Num.toStr (List.len (Str.toUtf8 inputStr))),
        ]
        " "
