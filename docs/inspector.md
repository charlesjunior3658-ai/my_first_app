# Flutter inspector

Widget selected: Text "Networking" (the subtitle of the CCNA 1 ListTile, in the CourseList screen)
Source: main.dart line 94

## Size (read in the inspector)
- width: 1226.0
- height: 20.0
- padding inside the ListTile: top 35.9, bottom 8.1, left 52.0

## Constraints
The constraints field was not visible in my DevTools version (2.61.0) for this widget. By the rule "constraints go down", the ListTile gives the Text a maximum width of its own available width, and the Text chose its size (1226 by 20) within that limit.


## Explanation
Constraints go down, sizes go up, parent sets position.
The Text receives constraints from its parent (the ListTile), chooses its own size within them (here 1226 by 20), and then the ListTile decides its position, which explains the paddings around it. The width is large because my Edge window is wide.

Screenshot: docs/inspector.png