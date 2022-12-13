defmodule SmexTrack.Repo do
  use Ecto.Repo,
    otp_app: :smex_track,
    adapter: Ecto.Adapters.SQLite3
end
