"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language: https://en.wikipedia.org/wiki/Guido_van_Rossum
"""

##############################################################################################################
# Hi There 👋🏽
# For much of the Python syllabus, we will provide function stubs + docstrings.
# These are the expected function names with details to help you get started solving the exercise.
# In general, they hint at expected functionality, along with expected input and return types.
#
# However, you can completely clear out the stubs before you start coding. We recommend that
# you keep them, because they are already set up to work with the tests, which you can find in
# ./lasagna_test.py. If the tests don't find the expected names, they will throw import errors.
#
# ❗PLEASE NOTE❗ We are deviating a bit in this first exercise by asking you to practice defining
# functions & docstrings. We give you one completed stub below (bake_time_remaining), but have
# omitted the stubs and docstrings for the remaining two functions.
#
# We recommend copying the first stub + docstring, and then changing details like the function name
# and docstring text to match what is asked for in the #TODO comments and instructions.
# Once you have the correct stubs, you can get started with writing the code for each function body.
#
# ⭐ PS:  You should remove explanation comment blocks like this one, and should also
# remove any comment blocks that start with #TODO (or our analyzer will nag you about them)
################################################################################################################


EXPECTED_BAKE_TIME = 40

PREPARATION_TIME = 2

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(number_of_layers):
    """Calculate the preparation time

    :param number_of_layers: int - number of lasagna layers.
    :return: int - preparation time required for the number of layers of lasagna to be cooked.

    Function takes a number of lasagna layers and returns the total preparation time required
    for the lasagna. This calculation can be found by multiplying the PREPARATION_TIME constant
    by the number of lasagna layers.
    """
    return number_of_layers * PREPARATION_TIME 



def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate the total amount of elapsed time
    
    :param number_of_layers: int - number of lasagna layers.
    :param elapsed_bake_time: int - minutes the lasanga has already been baking for.
    :return: int - number of minutes that have elapsed since the beginning of preparation

    Function takes the number of lasanga layers and the number of minutes the lasagna
    has already been baking for. This calculation can be found by adding the amount of
    time it took to prepare the lasagna layers plus the amount of time the lasagna
    has been baking for.
    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
