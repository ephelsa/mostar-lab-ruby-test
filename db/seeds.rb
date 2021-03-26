# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
              {
                username: "landres",
                full_name: "Leonardo Andrés Pérez Castilla",
                password: "SecretPass"
              },
              {
                username: "araldo",
                full_name: "Andrea Giraldo",
                password: "s3cr3t"
              }
            ])

# Movies creation
movies = Movie.create([
                        {
                          movie_id: 458576,
                          title: "Monster Hunter",
                          description: "A portal transports Cpt. Artemis and an elite unit of soldiers to a strange world where powerful monsters rule with deadly ferocity. Faced with relentless danger, the team encounters a mysterious hunter who may be their only hope to find a way home.",
                          release_date: "2020-12-18",
                          duration: 104,
                          rate: 72,
                          earns: 25814306,
                          image_url: "https://www.themoviedb.org/t/p/w1280/1UCOF11QCw8kcqvce8LKOO6pimh.jpg"
                        },
                        {
                          movie_id: 527774,
                          title: "Raya and the Last Dragon",
                          description: "Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and it’s up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.",
                          release_date: "2021-03-05",
                          duration: 107,
                          rate: 84,
                          earns: 56482606,
                          image_url: "https://www.themoviedb.org/t/p/w1280/lPsD10PP4rgUGiGR4CCXA6iY0QQ.jpg"
                        },
                        {
                          movie_id: 529203,
                          title: "The Croods: A New Age",
                          description: "Searching for a safer habitat, the prehistoric Crood family discovers an idyllic, walled-in paradise that meets all of its needs. Unfortunately, they must also learn to live with the Bettermans -- a family that's a couple of steps above the Croods on the evolutionary ladder. As tensions between the new neighbors start to rise, a new threat soon propels both clans on an epic adventure that forces them to embrace their differences, draw strength from one another, and survive together.",
                          release_date: "2020-11-25",
                          duration: 95,
                          rate: 75,
                          earns: 135076090,
                          image_url: "https://www.themoviedb.org/t/p/w1280/tbVZ3Sq88dZaCANlUcewQuHQOaE.jpg"
                        },
                      ])

# Tags creation
tags = Tag.create([
                    {
                      tag_id: 1,
                      name: "Family"
                    },
                    {
                      tag_id: 2,
                      name: "Fantasy"
                    },
                    {
                      tag_id: 3,
                      name: "Animation"
                    },
                    {
                      tag_id: 4,
                      name: "Comedy"
                    },
                    {
                      tag_id: 5,
                      name: "Adventure"
                    },
                    {
                      tag_id: 6,
                      name: "Action"
                    }
                  ])

# Adding tags for movies
movies[0].tags << tags[1]
movies[0].tags << tags[4, 5]
movies[1].tags << tags[0, 2]
movies[1].tags << tags[4, 5]
movies[2].tags << tags[0, 3]

# Casts creation
Cast.create([
              {
                person: "Milla Jovovich",
                interpretation: "Artemis",
                movie: movies[0]
              },
              {
                person: "Tony Jaa",
                interpretation: "The Hunter",
                movie: movies[0]
              },
              {
                person: "T.I.",
                interpretation: "Link",
                movie: movies[0]
              },
              {
                person: "Ron Perlman",
                interpretation: "Admiral",
                movie: movies[0]
              },
              {
                person: "Diego Boneta",
                interpretation: "Marshall",
                movie: movies[0]
              },
              {
                person: "Kelly Marie Tran",
                interpretation: "Raya (voice)",
                movie: movies[1]
              },
              {
                person: "Awkwafina",
                interpretation: "Sisu (voice)",
                movie: movies[1]
              },
              {
                person: "Izaac Wang",
                interpretation: "Boun (voice)",
                movie: movies[1]
              },
              {
                person: "Gemma Chan",
                interpretation: "Namaari (voice)",
                movie: movies[1]
              },
              {
                person: "Daniel Dae Kim",
                interpretation: "Benja (voice)",
                movie: movies[1]
              },
              {
                person: "Benedict Wong",
                interpretation: "Tong (voice)",
                movie: movies[1]
              },
              {
                person: "Nicolas Cage",
                interpretation: "Grug Crood (voice)",
                movie: movies[2]
              },
              {
                person: "Emma Stone",
                interpretation: "Eep Crood  (voice)",
                movie: movies[2]
              },
              {
                person: "Ryan Reynolds",
                interpretation: "Guy (voice)",
                movie: movies[2]
              },
              {
                person: "Peter Dinklage",
                interpretation: "Phil Betterman (voice)",
                movie: movies[2]
              },
              {
                person: "Leslie Mann",
                interpretation: "Hope Betterman (voice)",
                movie: movies[2]
              },
              {
                person: "Kelly Marie Tran",
                interpretation: "Dawn Betterman (voice)",
                movie: movies[2]
              },
            ])