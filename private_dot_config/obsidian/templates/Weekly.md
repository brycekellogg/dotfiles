<%*
	// Create template variables corresponding to the dates of each day in the week
	let dateMonday    = tp.date.now('YYYY-MM-DD', 0, tp.config.target_file.basename, '[Week] WW - YYYY');
	let dateTuesday   = tp.date.now('YYYY-MM-DD', 1, tp.config.target_file.basename, '[Week] WW - YYYY');
	let dateWednesday = tp.date.now('YYYY-MM-DD', 2, tp.config.target_file.basename, '[Week] WW - YYYY');
	let dateThursday  = tp.date.now('YYYY-MM-DD', 3, tp.config.target_file.basename, '[Week] WW - YYYY');
	let dateFriday    = tp.date.now('YYYY-MM-DD', 4, tp.config.target_file.basename, '[Week] WW - YYYY');
%>
# Days
## Monday

### Tasks
```tasks
due on <% dateMonday %>
```
### Daily Agenda
### Meeting Notes

## Tuesday
### Tasks
```tasks
due on <% dateTuesday %>
```

### Daily Agenda
### Meeting Notes

## Wednesday
### Tasks
```tasks
due on <% dateWednesday %>
```

### Daily Agenda
### Meeting Notes
## Thursday
### Tasks
```tasks
due on <% dateThursday %>
```
### Daily Agenda
### Meeting Notes
## Friday
### Tasks
```tasks
due on <% dateFriday %>
```
### Daily Agenda
### Meeting Notes

# Tasks
## This Week
```tasks
due on or after  <% dateMonday %>
due on or before <% dateFriday %>
```
## Overdue
```tasks
overdue
```
