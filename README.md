[![Build Status](https://img.shields.io/github/forks/https://github.com/okfn-oe/BANK-fail-tracker/.svg?style=plastic)](https://github.com/https://github.com/okfn-oe/BANK-fail-tracker/)
[![Test Coverage](http://img.shields.io/coveralls/https://github.com/okfn-oe/BANK-fail-tracker//master.svg?style=plastic)](https://coveralls.io/r/https://github.com/okfn-oe/BANK-fail-tracker/?branch=master)
[![Dependency Status](https://www.versioneye.com/user/projects/https://github.com/okfn-oe/BANK-fail-tracker//badge.svg?style=plastic)](https://www.versioneye.com/user/projects/https://github.com/okfn-oe/BANK-fail-tracker/)
[![NPM Downloads](https://img.shields.io/npm/dm/https://github.com/okfn-oe/BANK-fail-tracker/.svg?style=plastic)](https://www.npmjs.com/package/https://github.com/okfn-oe/BANK-fail-tracker/)


# BANK-fail-tracker
Data fetching & Processing of Failed Bank Tracker

# Objective

The [Open Economics](www.openeconomics.net) work group from OKFN was the ultimate
creator of this project, where people would fill in Banks that have failed
throughtout time.
[Date With Data](http://datewithdata.pt/) is a group that has been focusing on
making data public.

This repository is the one that will separate data that can be retrieved from
the previously announced project and that will lead to three separate datasets
to be published in Central de Dados.

 * [Bank stress test results](https://github.com/gsilvapt/bancos-testes-stress)
 * [List of failed banks](https://github.com/gsilvapt/bancos-falidos)
 * [Banks that were aided financially](https://github.com/gsilvapt/bancos-com-injecao)

## Source
The data is retrieved from  [the Open Economics project spreadsheet](https://docs.google.com/spreadsheets/d/1X35LxE2Vi7kYXlXkh_4TVnocq8AqTzdpCbaXoMjCB_8/edit#gid=0), which is community driven.
The initial spreadsheet is not being updated for a while, but, fortunately for
us, no banks have been accusing severe financial distress.

## Data treatment

Although one the most important principles of data analysis is to not mess too
much with the data, some cautions had to betaken care of in this process,
specially to fulfill the purpose of this project.

The R script included in this project (free for anyone to improve the code!),
only changes column names and removes unnecessary columns for a more appropriate
use of this data for (Central de Dados)[http://centraldedados.pt/]. Notwithstanding,
the script contains commentaries along its code.
