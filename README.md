# Geckoboard dashboard

Demo support ticket analysis dashboard, created from a subset of [this data](https://www.kaggle.com/vipulshinde/incident-response-log).

![Dashboard screenshot](https://raw.githubusercontent.com/mirianbr/geckoboard-cs/main/screenshot.png)

The data was:
1. processed, reviewed and sampled using Excel
2. imported to Heroku's PostgreSQL using [DBeaver](https://dbeaver.io) 

[This file](https://www.kaggle.com/vipulshinde/incident-response-log?select=Incident_response.txt) (from the original Kaggle repo) presents the details on all the fields available. 

Here's the excerpt for the fields I've kept:

```
Attribute Information:

1. number: incident identifier (24,918 different values);
2. incident state: eight levels controlling the incident management process transitions from opening until closing the case;
3. active: boolean attribute that shows whether the record is active or closed/canceled;
4. reassignment_count: number of times the incident has the group or the support analysts changed;
5. reopen_count: number of times the incident resolution was rejected by the caller;
6. sys_mod_count: number of incident updates until that moment;
7. made_sla: boolean attribute that shows whether the incident exceeded the target SLA;
21. impact: description of the impact caused by the incident (values: 1â€“High; 2â€“Medium; 3â€“Low);
22. urgency: description of the urgency informed by the user for the incident resolution (values: 1â€“High; 2â€“Medium; 3â€“Low);
23. priority: calculated by the system based on 'impact' and 'urgency';
26. knowledge: boolean attribute that shows whether a knowledge base document was used to resolve the incident;
35. resolved_at: incident user resolution date and time (dependent variable);
36. closed_at: incident user close date and time (dependent variable).
```
