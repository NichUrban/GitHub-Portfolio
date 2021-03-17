using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace EmailAddressGeneratorLib.Tests
{
    public class EmailAddressGeneratorTests
    {
        // test creating an email address for someone without a middle name, and is non-manager
        [Fact]
        public void GenerateEmailAddressNoMiddle_ShouldWork() 
        {
            // Arrange
            UserModel user = new UserModel { FirstName = "Abraham", LastName = "Lincoln" };
            string expected = "alincoln@sharpmail.org";

            // Act
            string actual = EmailAddressGenerator.GenerateEmailAddress(user);

            // Assert
            Assert.Equal(expected, actual);
        }

        // test creating an email address for someone with a middle name, and is non-manager
        [Fact]
        public void GenerateEmailAddressFullName_ShouldWork() 
        {
            // Arrange
            UserModel user = new UserModel { FirstName = "Edgar", MiddleName = "Allan", LastName = "Poe" };
            string expected = "eapoe@sharpmail.org";

            // Act
            string actual = EmailAddressGenerator.GenerateEmailAddress(user);

            // Assert
            Assert.Equal(expected, actual);
        }

        // test creating an email address for someone without a middle name, and is a manager
        [Fact]
        public void GenerateEmailAddressNoMiddleIsManager_ShouldWork() 
        {
            // Arrange
            UserModel user = new UserModel { FirstName = "Emma", LastName = "Watson", IsManager = true };
            string expected = "ewatson.mgmt@sharpmail.org";

            // Act
            string actual = EmailAddressGenerator.GenerateEmailAddress(user);

            // Assert
            Assert.Equal(expected, actual);
        }

        // test creating an email address for someone with a full name, and is a manager
        [Fact]
        public void GenerateEmailAddressFullNameIsManager_ShouldWork() 
        {
            // Arrange
            UserModel user = new UserModel { FirstName = "Maynard", MiddleName = "James", LastName = "Keenan", IsManager = true };
            string expected = "mjkeenan.mgmt@sharpmail.org";

            // Act
            string actual = EmailAddressGenerator.GenerateEmailAddress(user);

            // Assert
            Assert.Equal(expected, actual);
        }

        // multiple tests checking to see if an ArguementException is thrown when it is expected to
        [Theory]
        [InlineData("George", "", "LastName")]
        [InlineData("", "Washington", "FirstName")]
        [InlineData("George", " ", "LastName")]
        [InlineData(" ", "Washington", "FirstName")]
        [InlineData("George", null, "LastName")]
        [InlineData(null, "Washington", "FirstName")]
        public void GenerateEmailAddressEmptyOrNullOrWhitespaceNames_ShouldFail(string firstName, string lastName, string param)
        {
            
            UserModel user = new UserModel { FirstName = firstName, LastName = lastName };

            // Assert
            Assert.Throws<ArgumentException>(param, () => EmailAddressGenerator.GenerateEmailAddress(user));

        }

        
    }
}
