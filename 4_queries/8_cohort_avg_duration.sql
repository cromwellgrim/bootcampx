SELECT AVG(sub.total_duration) as avg_total_duration
FROM (
    SELECT cohorts.name as name, SUM(completed_at - started_at) as total_duration
    FROM assistance_requests
    JOIN students ON students.id = assistance_requests.student_id
    JOIN cohorts ON cohorts.id = cohort_id
    GROUP BY cohorts.name
    ) sub
