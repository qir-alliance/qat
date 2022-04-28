all:
	cd ConstArray && make all && make clean
	cd ConstQubitArray && make all && make clean
	cd LoopRecursion && make all && make clean
	cd OptimizationIssue && make all && make clean
	cd SimpleCallable && make all && make clean
	cd SimpleLoop && make all && make clean
	cd Bernstein–Vazirani && make all && make clean
	cd Grover && make all && make clean
	cd HiddenShift && make all && make clean
	cd IsingModel && make all && make clean
	cd ParallelQRng && make all && make clean
	cd TeleportChain && make all && make clean


stats:
	python analysis.py

clean:
	cd ConstArray  && make clean
	cd ConstQubitArray  && make clean
	cd LoopRecursion  && make clean
	cd OptimizationIssue  && make clean
	cd SimpleCallable  && make clean
	cd SimpleLoop  && make clean
	cd Bernstein–Vazirani && make clean
	cd Grover && make clean
	cd HiddenShift && make clean
	cd IsingModel && make clean
	cd ParallelQRng && make clean
	cd TeleportChain && make clean
	cd NegativeBaseProfiles/ExternalCall && make clean
	cd NegativeBaseProfiles/InternalCall && make clean
	cd NegativeBaseProfiles/IfStatement && make clean
	cd NegativeBaseProfiles/Loop && make clean			
	cd Atomics/AdvancedConstantFolding && make clean
	cd Atomics/BlockFolding && make clean
	cd Atomics/ConstantFolding && make clean
	cd Atomics/Inlining && make clean
	cd Atomics/Loop && make clean
	cd Atomics/QubitAllocation && make clean
	cd Atomics/SelectStatement && make clean
	cd MeasurementSeries && make clean
