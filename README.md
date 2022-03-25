# Alphabet List Scroll View
A customizable listview with A-Z side scrollbar to fast jump to the item of the selected character.
Quick scroll through list via dragging through alphabets. 

## API
| name | type | default | description |
| --- | --- | --- | --- |
| strList | List<String> | -  | List of Strings |
| itemBuilder | itemBuilder(context, index) | - | itemBuilder similar to itemBuilder in ListView.builder |
| highlightTextStyle | bool | false | highlight the focused pin box. |
| normalTextStyle | Color | Colors.black | Set color of the focused pin box. |
| showPreview | bool | true | show preview on screen |
| keyboardUsage | bool | true | The alphabet list will be wrapped in scrollview. |
| indexedHeight | double Function(int) | query the height of widget with index |  |
| headerWidgetList | List<AlphabetScrollListHeader> | headers |  |

### AlphabetScrollListHeader
| name | type | default | description|
| ---- | ---- | ------- | ---------- |
| widgetList | List<Widget> | [] |   |
| icon | Icon | | Icon shows in the side alphabet list and the preview|
| indexedHeaderHeight| double Function(int) | | query the height of header with index |
