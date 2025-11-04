#!/bin/bash

echo "=== Testing PA7 Solutions ==="
echo

echo "Q1: Testing typed program..."
java -cp Java/ Rep < program
echo

echo "Q2: Testing let expression type..."
cat << 'EOF' | java -cp Java/ Rep 2>&1 | head -2
let
  p = proc(f:[int=>int]):[int=>int] proc(x:int):int .f(.f(x))
  q = proc(t:int):int *(t,t)
in
  .p(q)
EOF
echo "Expected: [int=>int] (procedure that applies function twice)"
echo

echo "Q4: Verifying all type error examples..."
echo
for i in 1 2 3 4 5 6 7; do
  echo "Test $i:"
  java -cp Java/ Rep < test$i.type1 2>&1 | grep -E "type mismatch|apply a non-procedure|argument number mismatch"
  echo
done

echo "=== All Tests Complete ==="