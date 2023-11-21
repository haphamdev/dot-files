#!/usr/bin/env python3

import random

dict = {}
dict["Moving the needle"] = [100, "Make change in something so that the effect is measurable"]
dict["Terminal velocity"] = [30, "Max velocity when you drop something from the air"]
dict["With a bullet to the temple"] = [100, "Shot someone dead on the side of their head"]
dict["Beneficial"] = [70, "Improving a situation; having a helpful or useful effect"]
dict["Backstory"] = [40, "The story about how something was created or happened"]
dict["Go down the rabbit hole"] = [70, "Jump into a difficult situation"]
dict["Drop off"] = [20, "Leave something in the middle"]
dict["It does exactly what it says on the tin"] = [100, "Something does exactly what it is supposed to do"]
dict["From my gut feeling"] = [100, "Not based on fact, but from the feeling"]
dict["Invaluable"] = [70, "Means a lot, very valuable"]
dict["For the time being"] = [100, "For the present, until some other arrangement is made"]
dict["Bump into someone"] = [60, "Meeting someone unexpectedly and surprisingly"]
dict["Keep the ball rolling"] = [100, "Make something continue to work as expected"]
dict["In the first place"] = [20, "As the first consideration or point"]
dict["Culprit"] = [50, "The person who is responsible for a crime or misdeed"]
dict["At some point"] = [70, "Sometime; at an indefinite time"]
dict["Post-it note"] = [30, "A small paper used for writing note"]
dict["Shooting in the dark"] = [60, "Attempt to guess something with a little chance of success"]
dict["Low-hanging fruit"] = [100, "Something that can be easily done, achieve or taken advantage of"]

probs = list(map(lambda item: item[0], list(dict.values())))
phrase = random.choices(list(dict.keys()), weights = probs)[0]
meaning = dict[phrase][1]
print(f"#[fg=colour16,bold]{phrase}: #[nobold]{meaning}")
