
----------

runs (Perl Dancer web project)
---------

> * Мотивацията зад проекта се крепи на 3 принципа:

> **KISS** (Keep it simple silly);

> **Stay small** - изграждане на малки части, една по една и oбединението им в едно цяло;

> **User Experience** - Най-важното освен качествения код е и проекта не само да е красив на външен вид, но и полезен, на хората, които го ползват.


#### <i class="icon-file"></i>Описание:
Приложението ще има за цел да служи като днвник (логър) на разстоянията, времето и описание на тренировките на бягане на потребителя, както и да му каже статистика за напредъка му.


#### <i class="icon-file"></i>Какво ще вклюва проекта:
#### <i class="icon-file"></i>1. Описание на функционалностите в проекта:

1.1 Екрани за въвеждане на разстоянието и времето на всяко бягане на бегача;

1.2 Преглед на предишните бягания на бегача;

1.5 Екрани за статистически данни.

#### <i class="icon-file"></i>2. Използвани технологии:
2.1 Dancer като web framework;

2.2 Данните ще се пазят в база данни (sqlite3);

2.3 Използване на ORM na DBIx;

Some not so trivial useful notes:
after installing (sudo  cpanm  DBIx::Class::Schema::Loader )

run in terminal:
dbicdump MyApp::Schema dbi:sqlite:foo

For salting passwords (sudo cpanm Authen::Passphrase::SaltedDigest)

for messaging (sudo cpanm Dancer::Plugin::FlashMessage)

2.4 Използване на highcharts (http://www.highcharts.com/) за представяне на статистическите данни;

2.5 Интерфейс: Twitter Bootstrap.



