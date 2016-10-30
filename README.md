# taskman
WIP - A Ruby gem for managing long-running tasks (e.g. polling an API)

Nothing to see here, yet...

But, here's the idea: Something for running your periodic or 
long-running tasks, such as polling tasks, such that guarantees are
provided that each task is always running when it should be, and
there are no duplicate instances. There are many tasks that can't be
made idempotent, or mustn't be run concurrently - so this will help
keep them going, moving them between running instances of taskman if
necessary, while guaranteeing non-duplication.

### Run code

* Periodically (fixed interval, e.g. start every 5 minutes), either 
with overlapping allowed, or with a minimum interval between runs 
(can be zero)
* With fixed gap (e.g. wait 10 seconds in between executions)
* Once

### Retry policy
* None (treat failure the same as success)
* Immediate restart (fixed interval 0)
* Fixed interval (e.g. wait 10 seconds then try again)
* Exponential backoff

### UI
* See running and scheduled jobs
* Restart a running job
* Pause or resume a worker
* Thread dump

### Jobs
* Workers can be standalone and auto-run when taskman is launched
* Or can be parameterised and data-driven

### Locking, persistence etc - either:
* PostgreSQL
* Redis

## Examples:

* I want a job that checks a database query every 5 seconds and 
performs an action if necessary.
* I want a job that continuously waits for a long polling operation 
to return some data, and performs an action if necessary.


