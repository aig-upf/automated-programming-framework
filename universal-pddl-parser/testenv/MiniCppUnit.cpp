/*
 * Copyright (c) 2003-2004  Pau Arumí & David García
 *
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 */

#include <MiniCppUnit.h>

TestsListener& TestsListener::theInstance()
{
	static TestsListener instance;
	return instance;
}

std::stringstream& TestsListener::errorsLog()
{
	if (_currentTestName)
		_log << "\n" << errmsgTag_nameOfTest() << (*_currentTestName) << "\n";
	return _log;
}

std::string TestsListener::logString()
{
	std::string toReturn = _log.str();
	_log.str("");
	return toReturn;
}
void TestsListener::currentTestName( std::string& name)
{
	_currentTestName = &name;
}
void TestsListener::testHasRun()
{
	std::cout << ".";
	theInstance()._executed++;
}
void TestsListener::testHasFailed()
{
	std::cout << "F";
	theInstance()._failed++;
}
void TestsListener::testHasThrown()
{
	std::cout << "E";
	theInstance()._exceptions++;
}
std::string TestsListener::summary()
{
	std::ostringstream os;
	os	<< "\nSummari:\n"
		<< "\033[" "1m\tExecuted Tests:         " 
		<< _executed << "\033[0m\n"
		<< "\033[32;1m\tPassed Tests:           " 
		<< (_executed-_failed-_exceptions) << "\033[0m\n";
	if (_failed > 0)
	{
		os 	<< "\033[31;1m\tFailed Tests:           " 
			<< _failed << "\033[0m\n";
	}
	if (_exceptions > 0)
	{
		os 	<< "\033[31;1m\tUnexpected exceptions: " 
			<< _exceptions << "\033[0m\n";
	}
	os << std::endl;
	return os.str();
}
bool TestsListener::allTestsPassed()
{
	return !theInstance()._exceptions && !theInstance()._failed;
}




void Assert::assertTrue(char* strExpression, bool expression,
		const char* file, int line)
{
	if (!expression)
	{
		TestsListener::theInstance().errorsLog() << "\n"
			<< errmsgTag_testFailedIn() << file 
			<< errmsgTag_inLine() << line << "\n" 
			<< errmsgTag_failedExpression() << strExpression << "\n";
		TestsListener::theInstance().testHasFailed();
	}
}

void Assert::assertTrueMessage(char* strExpression, bool expression, 
		const char* message, const char* file, int line)
{
	if (!expression)
	{
		TestsListener::theInstance().errorsLog() << "\n"
			<< errmsgTag_testFailedIn() << file
			<< errmsgTag_inLine() << line << "\n" 
			<< errmsgTag_failedExpression() << strExpression << "\n"
			<< message<<"\n";
		TestsListener::theInstance().testHasFailed();
	}
}



void Assert::assertEquals( const char * expected, const char * result,
	const char* file, int line )
{
	assertEquals(std::string(expected), std::string(result),
		file, line);
}
void Assert::assertEquals( const bool& expected, const bool& result,
	const char* file, int line )
{
	assertEquals(
		(expected?"true":"false"), 
		(result?"true":"false"),
		file, line);
}

int Assert::notEqualIndex( const std::string & one, const std::string & other )
{
	int end = std::min(one.length(), other.length());
	for ( int index = 0; index < end; index++ )
		if (one[index] != other[index] )
			return index;
	return end;
}

/**
 * we overload the assert with string doing colored diffs
 *
 * MS Visual6 doesn't allow string by reference :-( 
 */
void Assert::assertEquals( const std::string expected, const std::string result,
	const char* file, int line )
{
	if(expected == result)
		return;
	
	int indexDiferent = notEqualIndex(expected, result);
	TestsListener::theInstance().errorsLog()
		<< file << ", line: " << line << "\n"
		<< errmsgTag_expected() << "\n\033[36;1m" 
		<< expected.substr(0,indexDiferent)
		<< "\033[32;1m" << expected.substr(indexDiferent) << "\033[0m\n"
		<< errmsgTag_butWas() << "\033[36;1m \n" << result.substr(0,indexDiferent)
		<< "\033[31;1m" << result.substr(indexDiferent) << "\033[0m\n";

	TestsListener::theInstance().testHasFailed();
}
void Assert::fail(const char* reason, const char* file, int line)
{
	TestsListener::theInstance().errorsLog() <<
		file << errmsgTag_inLine() << line << "\n" <<
		"Reason: " << reason << "\n";

	TestsListener::theInstance().testHasFailed();
}


