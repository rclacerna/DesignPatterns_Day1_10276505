# DesignPatterns_Day1_10276505
Exercise 1: Template Method and Strategy

# Journal
In this excersize, cooming code smells were emmediately seen. 
- Repeated code which violates DRY principle
- Hard to extend and refactor the functionalities due to tight-coupling

The design patterns I've decided to implement are the Strategy pattern and Template pattern.
First, the Strategy pattern was implemented so that we can dynamically switch between different classes when needed, this also makes our code much easier to extend and flexible when we would like to add another play strategy.
In a strategy pattern the main value is in being able to switch out different implementations for different situations. Allowing the player the ability to choose the the strategy he/she wants. This is implemented in the ```Participant.rb```


The template pattern was then implemented, due to all the repeated code from the different strategies ```Play_template.rb``` class contains all the similar code that each strategy shares, This class is inherited by:
- Play_randomly.rb
- Play_linear.rb
- Play_smart_randon.rb
- Play_binary_search.rb

The only functionalities that the strategies differ are: 
- ``play``
- ``guess_num``

In which-case they are left within the containing class.
