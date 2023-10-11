; ModuleID = 'qat-link'
source_filename = "qat-link"

define i64 @Entry_Point_Name() #0 {
entry:
%0 = sdiv i64 10, 0
ret i64 0
}

attributes #0 = { "entry_point" }

