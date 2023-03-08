defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @earth_seconds 31_557_600
  @mercury_orbital_period 0.2408467
  @venus_orbital_period 0.61519726
  @earth_orbital_period 1.0
  @mars_orbital_period 1.8808158
  @jupiter_orbital_period 11.862615
  @saturn_orbital_period 29.447498
  @uranus_orbital_period 84.016846
  @neptune_orbital_period 164.79132

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(:mercury, seconds) do
    mercury_seconds = @earth_seconds * @mercury_orbital_period
    {:ok, Float.round(seconds / mercury_seconds, 2)}
  end

  def age_on(:venus, seconds) do
    venus_seconds = @earth_seconds * @venus_orbital_period
    {:ok, Float.round(seconds / venus_seconds, 2)}
  end

  def age_on(:earth, seconds) do
    earth_seconds = @earth_seconds * @earth_orbital_period
    {:ok, Float.round(seconds / earth_seconds, 2)}
  end

  def age_on(:mars, seconds) do
    mars_seconds = @earth_seconds * @mars_orbital_period
    {:ok, Float.round(seconds / mars_seconds, 2)}
  end

  def age_on(:jupiter, seconds) do
    jupiter_seconds = @earth_seconds * @jupiter_orbital_period
    {:ok, Float.round(seconds / jupiter_seconds, 2)}
  end

  def age_on(:saturn, seconds) do
    saturn_seconds = @earth_seconds * @saturn_orbital_period
    {:ok, Float.round(seconds / saturn_seconds, 2)}
  end

  def age_on(:uranus, seconds) do
    uranus_seconds = @earth_seconds * @uranus_orbital_period
    {:ok, Float.round(seconds / uranus_seconds, 2)}
  end

  def age_on(:neptune, seconds) do
    neptune_seconds = @earth_seconds * @neptune_orbital_period
    {:ok, Float.round(seconds / neptune_seconds, 2)}
  end

  def age_on(_, _seconds), do: {:error, "not a planet"}
end
