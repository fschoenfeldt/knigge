defmodule Behaviour.WithNoParens do
  use ExUnit.Case

  import Knigge.Test.SaltedModule

  test "works fine with a callback without parens" do
    Application.put_env(:ex_knigge, :working_behaviour, SomeModule)

    # Should not raise
    behaviour =
      defmodule_salted WorkingBehaviour do
        use Knigge,
          otp_app: :ex_knigge,
          config_key: :working_behaviour

        @callback fun :: boolean
      end

    Application.delete_env(:ex_knigge, :working_behaviour)

    assert behaviour.__knigge__(:implementation) == SomeModule
  end
end
