# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

addresses = Address.create([{ street_1: '7941 Southtown Dr',
                              city: 'Bloomington',
                              state: 'MN',
                              zip_code: '55431',
                              country: 'United States' },
                            { street_1: '1556 University Ave W',
                              city: 'St. Paul',
                              state: 'MN',
                              zip_code: '55104',
                              country: 'United States' }])
alleys = Alley.create([{ name: 'AMF Southtown Lanes', address: addresses[0] },
                       { name: 'Midway Pro Bowl', address: addresses[1] }])

leagues = League.create([{ name: "Wednesday Men's",
                 start_date: Date.new(2015, 9, 9),
                 occurrences: 32,
                 frequency: 1,
                 day: 'Wednesday',
                 time: '6:30pm',
                 practice_length: 15,
                 alley: alleys[0],
                 scratch: 220,
                 handicap_percent: 90 },
               { name: 'Sport Shot',
                 start_date: Date.new(2015, 9, 7),
                 occurrences: 16,
                 frequency: 2,
                 day: 'Monday',
                 time: '7:00pm',
                 practice_length: 10,
                 alley: alleys[0],
                 scratch: 220 },
               { name: 'Trade Union',
                 start_date: Date.new(2015, 9, 10),
                 occurrences: 30,
                 frequency: 1,
                 day: 'Thursday',
                 time: '7:00pm',
                 practice_length: 10,
                 alley: alleys[1],
                 scratch: 200,
                 handicap_round: 'down' }])

Bowler.create()
Team.create
