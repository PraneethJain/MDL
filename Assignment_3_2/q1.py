from collections import namedtuple
from rich import print
from copy import deepcopy

Cell = namedtuple("Cell", ["utility", "direction"])
Grid = list[list[Cell]]

p = 0.7
step_cost = -0.04
discount_factor = 0.95
initial_grid: Grid = [
    [Cell(0, None), Cell(-1, None), Cell(1, None)],
    [Cell(0, None), Cell(0, None), Cell(0, None)],
    [Cell(0, None), Cell(None, None), Cell(0, None)],
    [Cell(0, None), Cell(0, None), Cell(0, None)],
]
penalty_pos = (0, 1)
reward_pos = (0, 2)


def iterate(grid: Grid) -> Grid:
    new_grid = deepcopy(grid)

    def is_valid(x: int, y: int) -> bool:
        if x < 0 or x >= len(grid) or y < 0 or y >= len(grid[0]):
            return False
        return grid[x][y].utility is not None

    def perpendicular(dx: int, dy: int) -> list[tuple[int, int]]:
        if abs(dx) == 1 and dy == 0:
            return [(0, 1), (0, -1)]
        elif dx == 0 and abs(dy) == 1:
            return [(1, 0), (-1, 0)]
        else:
            raise ValueError("Invalid Direction")

    directions: list[tuple[int, int]] = [(0, 1), (1, 0), (0, -1), (-1, 0)]

    for x, row in enumerate(grid):
        for y, cell in enumerate(row):
            if not is_valid(x, y) or penalty_pos == (x, y) or reward_pos == (x, y):
                continue

            def find_utility(nx: int, ny: int) -> float:
                return grid[nx][ny].utility if is_valid(nx, ny) else cell.utility

            max_util = -99999
            direction = None
            for dx, dy in directions:
                expected_utility = p * find_utility(x + dx, y + dy) + sum(
                    (1 - p) / 2 * find_utility(x + ddx, y + ddy)
                    for ddx, ddy in perpendicular(dx, dy)
                )
                if (new_max_util := step_cost + discount_factor * expected_utility) > max_util:
                    max_util = new_max_util
                    match (dx, dy):
                        case (0, 1):
                            direction="south"
                        case (0, -1):
                            pass
                        case (1, 0):
                            pass
                        case (-1, 0):
                            pass
                        
                max_util = max(max_util, step_cost + discount_factor * expected_utility)
            new_grid[x][y] = Cell(max_util, None)

    return new_grid


if __name__ == "__main__":
    g = iterate(initial_grid)
    # print(g)
    for _ in range(1000):
        g = iterate(g)
    for x in g:
        for y in x:
            print(y.utility, end="\t")
        print()
