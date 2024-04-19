from enum import Enum, auto
import random


class Colors(Enum):
    RED = auto()
    BLACK = auto()
    GREEN = auto()


class BettingStrategy(Enum):
    CONSTANT_RED_BLACK = auto()
    DOUBLING_RED_BLACK = auto()
    CONSTANT_GREEN = auto()
    RANDOM_BETTING = auto()


def constant_red_black(moni: int, rolls: list[Colors]) -> int:
    for roll in rolls:
        moni -= 10
        if roll == Colors.RED:
            moni += 20
    return moni


def doubling_red_black(moni: int, rolls: list[Colors]) -> int:
    bet = 10
    for roll in rolls:
        moni -= bet
        if roll == Colors.RED:
            moni += 2 * bet
        else:
            bet *= 2
    return moni


def constant_green(moni: int, rolls: list[Colors]) -> int:
    for roll in rolls:
        moni -= 10
        if roll == Colors.GREEN:
            moni += 180
    return moni


def random_betting(moni: int, rolls: list[Colors]) -> int:
    for roll in rolls:
        moni -= 10
        if roll == random.choice([Colors.RED, Colors.BLACK, Colors.GREEN]):
            if roll == Colors.GREEN:
                moni += 180
            else:
                moni += 20
    return moni


def simulate(x: int, betting_strategy: BettingStrategy) -> None:
    moni = 1000

    rolls = random.choices(
        population=[Colors.RED, Colors.BLACK, Colors.GREEN],
        weights=[x / 100, x / 100, (100 - 2 * x) / 100],
        k=1000,
    )

    match betting_strategy:
        case BettingStrategy.CONSTANT_RED_BLACK:
            moni = constant_red_black(moni, rolls)
        case BettingStrategy.DOUBLING_RED_BLACK:
            moni = doubling_red_black(moni, rolls)
        case BettingStrategy.CONSTANT_GREEN:
            moni = constant_green(moni, rolls)
        case BettingStrategy.RANDOM_BETTING:
            moni = random_betting(moni, rolls)
    print(moni)


if __name__ == "__main__":
    simulate(4, BettingStrategy.CONSTANT_RED_BLACK)
