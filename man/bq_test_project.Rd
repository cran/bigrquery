% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bq-test.R
\name{bq_test_project}
\alias{bq_test_project}
\alias{bq_test_init}
\alias{bq_test_dataset}
\alias{bq_testable}
\alias{bq_authable}
\alias{gs_test_bucket}
\alias{gs_test_object}
\title{Project to use for testing bigrquery}
\usage{
bq_test_project()

bq_test_init(name = "basedata")

bq_test_dataset(name = random_name(), location = "US")

bq_testable()

bq_authable()

gs_test_bucket()

gs_test_object(name = random_name())
}
\arguments{
\item{name}{Dataset name - used only for testing.}
}
\value{
\code{bq_test_project()} returns the name of a project suitable for use in
testing. \code{bq_test_dataset()} creates a temporary dataset whose lifetime is
tied to the lifetime of the object that it returns.
}
\description{
You'll need to set the \code{BIGQUERY_TEST_PROJECT} (name of a project) and
\code{BIGQUERY_TEST_BUCKET} (name of bucket) env vars in order to run bigrquery
tests locally. I recommend creating a new project because the tests involve
both reading and writing in BigQuery and Cloud Storage.

The \code{BIGQUERY_TEST_PROJECT} must have billing enabled for the project. While
logged in, via \code{bq_auth()}, as a user with permission to work in
\code{BIGQUERY_TEST_PROJECT}, run \code{bq_test_init()} once to perform some setup.
}
\section{Testing}{
 In tests, \code{bq_test_project()} (and hence \code{bq_test_dataset()}) will
automatically skip if auth and a test project are not available.
}

\examples{
\dontshow{if (bq_testable()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
ds <- bq_test_dataset()
bq_mtcars <- bq_table_upload(bq_table(ds, "mtcars"), mtcars)

# dataset and table will be automatically deleted when ds is GC'd
\dontshow{\}) # examplesIf}
}
\keyword{internal}
