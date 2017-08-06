# We often need simple pairs of key-values.

[ ​name:​ ​"​​Dave"​, ​city:​ ​"​​Dallas"​, ​likes:​ ​"​​Programming"​ ]

# is actually:
[ {​:name​, ​"​​Dave"​}, {​:city​, ​"​​Dallas"​}, {​:likes​, ​"​​Programming"​} ]

# we can omit square brackets if kwlist is last or the only argument in fn call:
DB.save record, [ {​:use_transaction​, true}, {​:logging​, ​"​​HIGH"​} ]
# is the same as:
DB.save record, use_transaction:​ true, ​:logging: ​"​​HIGH"