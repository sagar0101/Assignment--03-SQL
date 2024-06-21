
SELECT 
    c.context_id,
    c.hacker_id,
    c.name,
    SUM(v.total_views) AS total_views,
    SUM(v.total_unique_views) AS total_unique_views,
    SUM(s.total_submissions) AS total_submissions,
    SUM(s.total_accepted_submissions) AS total_accepted_submissions
FROM 
    Contexts c
JOIN 
    Colleges co ON c.context_id = co.context_id
JOIN 
    Challenges ch ON c.context_id = ch.context_id AND co.college_id = ch.college_id
JOIN 
    Views v ON ch.challenge_id = v.challenge_id
JOIN 
    Submission_Stats s ON ch.challenge_id = s.challenge_id
GROUP BY 
    c.context_id, c.hacker_id, c.name
ORDER BY 
    c.context_id;
