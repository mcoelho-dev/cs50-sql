# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Random partitioning is great because it spreads the data evenly across all boats, so no single boat gets overloaded. The downside is that if you want to find observations from a specific time period, you have to search every single boat, since the data could be anywhere.

## Partitioning by Hour

Partitioning by hour makes it easy to find observations from a specific time period, since you know exactly which boat to look at. The problem is that if AquaByte collects most of its data between midnight and 1am, one boat ends up with way more data than the others, which creates an imbalance.

## Partitioning by Hash Value

Hash partitioning gives you the best of both worlds in some ways: the data is evenly distributed across all boats, and if you know the exact timestamp of an observation, you can calculate its hash value and go straight to the right boat. The downside is that if you want to search for a range of observations, like everything between midnight and 1am, you still have to check all the boats since the hash values don't follow any time-based order.
