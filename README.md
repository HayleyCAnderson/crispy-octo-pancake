# Robot Runner

## Run
* Run `ruby run.rb`
* Type `EXIT` to exit
* Type commands to control robot (must place first):
`PLACE X,Y,F`
`MOVE`
`LEFT`
`RIGHT`
`REPORT`

#### Examples
*Example A*
```
PLACE 0,0,NORTH
MOVE
REPORT
```
_Expected output: 0,1,NORTH_

*Example B*
```
PLACE 0,0,NORTH
LEFT
REPORT
```
_Expected output: 0,0,WEST_

*Example C*
```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```
_Expected output: 3,3,NORTH_

## Test
* Run `bundle`
* Run `rspec`

(There aren't actually any tests yet :(.)

## TODO
Since the logic is simple, I focused on exploring design options instead, and
spent too much time on that before getting to testing. That's the next step,
along with fixing a couple user error cases that aren't handled yet. Also, add
custom errors and raise errors so that the error swallowing behavior is only
happening at the top level.
