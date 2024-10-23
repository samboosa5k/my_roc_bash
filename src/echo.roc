app [main] { pf: platform "../dependencies/basic-cli/platform/main.roc" }

import pf.Stdout
import pf.Stdin

main =
    Stdout.line! "Next, you must accept and print input..."

    Task.loop {} echo

command : [Hello, Exit] -> Str
command = \alias ->
    when alias is
        Exit -> "Goodbye"
        Hello -> "Hello to you too!"

echo = \{} ->
    when Stdin.line |> Task.result! is
        Ok str ->
            if str == "exit" then
                commandResult = command Exit
                Stdout.line! (Str.concat "GOODBYE" commandResult)
                Task.ok (Done {})
            else if str == "hello" then
                commandResult = command Hello
                Stdout.line! (Str.concat "HELLO" commandResult)
                Task.ok (Step {})
            else
                Stdout.line! ("You have entered: $(str)")
                Task.ok (Step {})

        Err (StdinErr err) ->
            Stdout.line! ("There was an error $(Inspect.toStr err)")
            Task.ok (Done {})
