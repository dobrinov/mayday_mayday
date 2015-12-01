# Mayday, Mayday!

## Description
Simple event processing and alerting system written in Ruby.

## Why I decided to implement yet another monitoring system?
I have been working with monitoring systems for the last couple of months. During this time I had to evaluate a couple of monitoring tools/systems and understand very good what are the business requirements for such a thing. The conclusions to which I came are:
* Implementing a monitoring system is hard.
* They must be maintainable.
* They should produce meaningfull and actionable alarms.

The software of choice for the monitoring system on which I worked was [Riemann](http://riemann.io/). Nice and quick tool written in Clojure, which can be integrated with basically most of popular pieces of software out there. Aftet I worked it for some time I identified the following:

**pros**
* [quick](http://blog.robotninjas.org/2013/03/11/load-testing-riemann/)
* push - I pefer this over pull as if the server doesn't know anything about the targets of monitoring, makes the maintainence much simpler.
* flexible - almost everything can be inplemented with it (its configuration file is pure Clojure file).
* easy to integrate with a lot of databases and messaging services

**cons**
* aggregation
* [index](http://riemann.io/concepts.html) is not persisted
* clustering is not possible - [Riemann](http://riemann.io/) performs arbitrary computation over the event stream, with side effects and it cannot be distributed safely.
* flexible - lack of framework. If you need a scallable configuration you will have to implement one by yourself. If you do not take this in mind big configuration can get messy.
* no naming conventions for the services - There are really no rules for naming services. 
* event states are often not final - There are a lot of [Riemann](http://riemann.io/) clients which define event states which are often not those which we need. Because of this those events have to be processed additionally and those states to be changed.

The database of choice which I was using with [Riemann](http://riemann.io/) was [InfluxDB](https://influxdb.com/) - quite young series database.

## The monitoring system of the future


## Architecture

## Installation

## Benchmarks

## Roadmap

!!!

All alerting logic on one place!
All data on one place!
