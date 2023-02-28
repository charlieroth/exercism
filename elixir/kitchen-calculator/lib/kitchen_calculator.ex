defmodule KitchenCalculator do
  def get_volume({_unit, volume}), do: volume * 1.0

  def to_milliliter({:milliliter, volume}), do: {:milliliter, volume * 1.0}
  def to_milliliter({:cup, volume}), do: {:milliliter, volume * 240.0}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, volume * 30.0}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, volume * 5.0}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, volume * 15.0}

  def from_milliliter({_, ml}, :cup), do: {:cup, ml / 240.0}
  def from_milliliter({_, ml}, :fluid_ounce), do: {:fluid_ounce, ml / 30.0}
  def from_milliliter({_, ml}, :teaspoon), do: {:teaspoon, ml / 5.0}
  def from_milliliter({_, ml}, :tablespoon), do: {:tablespoon, ml / 15.0}
  def from_milliliter({_, ml}, :milliliter), do: {:milliliter, ml}

  def convert({:milliliter, vol}, :milliliter), do: to_milliliter({:milliliter, vol})
  def convert({:milliliter, vol}, :cup), do: to_milliliter({:cup, vol})
  def convert({:milliliter, vol}, :fluid_ounce), do: to_milliliter({:fluid_ounce, vol})
  def convert({:milliliter, vol}, :teaspoon), do: to_milliliter({:teaspoon, vol})
  def convert({:milliliter, vol}, :tablespoon), do: to_milliliter({:tablespoon, vol})

  def convert({:cup, vol}, :milliliter), do: to_milliliter({:cup, vol})
  def convert({:cup, vol}, :cup), do: {:cup, vol}
  def convert({:cup, vol}, :fluid_ounce), do: {:fluid_ounce, vol * 8}
  def convert({:cup, vol}, :teaspoon), do: {:teaspoon, vol * 48}
  def convert({:cup, vol}, :tablespoon), do: {:tablespoon, vol * 16}

  def convert({:fluid_ounce, vol}, :milliliter), do: to_milliliter({:fluid_ounce, vol})
  def convert({:fluid_ounce, vol}, :cup), do: {:cup, vol / 8}
  def convert({:fluid_ounce, vol}, :fluid_ounce), do: {:fluid_ounce, vol}
  def convert({:fluid_ounce, vol}, :teaspoon), do: {:teaspoon, vol * 6}
  def convert({:fluid_ounce, vol}, :tablespoon), do: {:tablespoon, vol * 2}

  def convert({:teaspoon, vol}, :milliliter), do: to_milliliter({:teaspoon, vol})
  def convert({:teaspoon, vol}, :cup), do: {:cup, vol / 48}
  def convert({:teaspoon, vol}, :fluid_ounce), do: {:fluid_ounce, vol / 6}
  def convert({:teaspoon, vol}, :teaspoon), do: {:teaspoon, vol}
  def convert({:teaspoon, vol}, :tablespoon), do: {:tablespoon, vol / 3}

  def convert({:tablespoon, vol}, :milliliter), do: to_milliliter({:tablespoon, vol})
  def convert({:tablespoon, vol}, :cup), do: {:cup, vol / 16}
  def convert({:tablespoon, vol}, :fluid_ounce), do: {:fluid_ounce, vol / 2}
  def convert({:tablespoon, vol}, :teaspoon), do: {:teaspoon, vol * 3}
  def convert({:tablespoon, vol}, :tablespoon), do: {:tablespoon, vol}
end
