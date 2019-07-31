defmodule AccountCore.ErrorHelpers do
  @moduledoc """
  Conveniences for translating and building error messages.
  """

  def parse_errors(changeset) do
    # translate_errors(changeset)
    changeset
  end
  @doc """
  Traverses and translates changeset errors.

  See `Ecto.Changeset.traverse_errors/2` and
  `AccountWeb.ErrorHelpers.translate_error/1` for more details.
  """
  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  @doc """
  Translates an error message using gettext.
  """
  def translate_error({msg, opts}) do
    # When using gettext, we typically pass the strings we want
    # to translate as a static argument:
    #
    #     # Translate "is invalid" in the "errors" domain
    #     dgettext("errors", "is invalid")
    #
    #     # Translate the number of files with plural rules
    #     dngettext("errors", "1 file", "%{count} files", count)
    #
    # Because the error messages we show in our forms and APIs
    # are defined inside Ecto, we need to translate them dynamically.
    # This requires us to call the Gettext module passing our gettext
    # backend as first argument.
    #
    # Note we use the "errors" domain, which means translations
    # should be written to the errors.po file. The :count option is
    # set by Ecto and indicates we should also apply plural rules.

    IO.inspect msg
    IO.inspect opts
    # if count = opts[:count] do
    #   Gettext.dngettext(AccountWeb.Gettext, "errors", msg, msg, count, opts)
    # else
    #   Gettext.dgettext(AccountWeb.Gettext, "errors", msg, opts)
    # end
  end
end
