/**
 * This stub is provided to make it straightforward to get started.
 */

export function twoFer(name?: string): string {
  let response = "One for you, one for me.";
  if (!name) {
    return response;
  }

  return response.replace("you", name);
}
