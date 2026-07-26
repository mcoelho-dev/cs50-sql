CREATE INDEX "students_identification" ON "enrollments"("student_id");

CREATE INDEX "enrolled_courses" ON "enrollments"("course_id");

CREATE INDEX "computer_science" ON "courses"("department", "number", "semester");

--index not needed

CREATE INDEX "semesters" ON "courses"("semester");

CREATE INDEX "sastified_courses" ON "satisfies"("course_id");

--index not needed

--index not needed
