# Demo 2 - File DB: access to simulation particles

SciServer also hosts the original raw simulation results containing the particles used in the Millennium simulations.
These were deemed not suitable (too large) toi store as relational tables when the original Millennium Database was constructed.

However interesting questions can be asked of the datasets for which the halo and galaxy catalogues on their own do not suffice.
Through its file storage and compute facilities, SciServer allows much more freedom in disseminating such data sets however, and here we show how 




Show how particles from halos can be retrieved by combining database queries to determing which files need be opened, and using python to actually retrieve the data.