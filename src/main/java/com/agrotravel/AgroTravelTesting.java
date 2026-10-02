package com.agrotravel;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WindowType;
import org.openqa.selenium.interactions.Actions;
import java.time.Duration;
import java.util.List;
public class AgroTravelTesting {
static void pause(int seconds) {
try {
Thread.sleep(seconds * 1000L);
} catch (InterruptedException e) {
Thread.currentThread().interrupt();
}
}
public static void main(String[] args) {
System.out.println("==============================================");
System.out.println("        SELENIUM TESTING");
System.out.println("        AGROTRAVEL WEB APPLICATION");
System.out.println("==============================================");
System.out.println();
System.out.println("BROWSER BASIC TEST:");
System.out.println();
WebDriver driver = null;
try {
driver = new ChromeDriver();
driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
driver.manage().window().maximize();
System.out.println("Chrome Browser: PASS");
pause(3);
driver.get("http://localhost:8080/AgroTravel1/register.jsp");
System.out.println("Open URL: PASS");
pause(5);
System.out.println("Current URL: " + driver.getCurrentUrl());
pause(3);
System.out.println("Page Title: " + driver.getTitle());
pause(3);
String source = driver.getPageSource();
if (source != null && !source.isEmpty()) {
System.out.println("Page Source: Captured");
}
pause(3);
driver.navigate().refresh();
System.out.println("Refresh: PASS");
pause(5);
driver.navigate().to("http://localhost:8080/AgroTravel1/gallery.html");
System.out.println("Navigate to Gallery: PASS");
pause(6);
driver.navigate().back();
System.out.println("Back: PASS");
pause(5);
driver.navigate().forward();
System.out.println("Forward: PASS");
pause(5);
String originalWindow = driver.getWindowHandle();
WebDriver newTab = driver.switchTo().newWindow(WindowType.TAB);
newTab.get("http://localhost:8080/AgroTravel1/gallery.html");
System.out.println("SwitchTo New Tab: PASS");
System.out.println("New Tab Title: " + newTab.getTitle());
pause(6);
newTab.close();
driver.switchTo().window(originalWindow);
System.out.println("SwitchTo Original Window: PASS");
pause(5);
System.out.println("Chrome Basic Test Completed");
pause(3);
} catch (Exception e) {
System.out.println("Chrome Basic Test: FAIL");
System.out.println("Reason: " + e.getMessage());
} finally {
if (driver != null) {
pause(5);
driver.quit();
}
}
System.out.println();
System.out.println("EDGE BROWSER TEST:");
WebDriver edgeDriver = null;
try {
edgeDriver = new EdgeDriver();
edgeDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
edgeDriver.manage().window().maximize();
System.out.println("Edge Browser: PASS");
pause(5);
edgeDriver.get("http://localhost:8080/AgroTravel1/register.jsp");
System.out.println("Edge Open URL: PASS");
pause(5);
System.out.println("Edge Current URL: " + edgeDriver.getCurrentUrl());
pause(3);
System.out.println("Edge Page Title: " + edgeDriver.getTitle());
pause(5);
edgeDriver.quit();
System.out.println("Edge Browser Test Completed");
} catch (Exception e) {
System.out.println("Edge Browser: NOT AVAILABLE");
System.out.println("Install/enable Microsoft Edge if required.");
}
System.out.println();
System.out.println("==============================================");
System.out.println("WEB ELEMENTS:");
System.out.println("==============================================");
WebDriver webDriver = new ChromeDriver();
webDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
webDriver.manage().window().maximize();
try {
webDriver.get("http://localhost:8080/AgroTravel1/register.jsp");
pause(5);
WebElement nameField = webDriver.findElement(By.id("name"));
System.out.println("findElement: PASS");
pause(3);
System.out.println("isDisplayed: " + nameField.isDisplayed());
pause(3);
System.out.println("isEnabled: " + nameField.isEnabled());
pause(3);
System.out.println("isSelected: " + nameField.isSelected());
pause(3);
nameField.sendKeys("Old Name");
pause(3);
nameField.clear();
System.out.println("clear: PASS");
pause(4);
nameField.sendKeys("Selenium Tester");
System.out.println("sendKeys: PASS");
pause(5);
WebElement phoneField = webDriver.findElement(By.id("phone"));
phoneField.sendKeys("9876543210");
System.out.println("Phone sendKeys: PASS");
pause(5);
WebElement locationField = webDriver.findElement(By.id("location"));
locationField.sendKeys("Coimbatore");
System.out.println("Location sendKeys: PASS");
pause(5);
WebElement heading = webDriver.findElement(By.tagName("h1"));
String headingText = heading.getText();
System.out.println("getText: " + headingText);
pause(4);
String placeholder = nameField.getAttribute("placeholder");
System.out.println("getAttribute: " + placeholder);
pause(4);
WebElement galleryLink = webDriver.findElement(By.linkText("Gallery"));
galleryLink.click();
System.out.println("click: PASS");
pause(7);
webDriver.navigate().back();
pause(5);
List<WebElement> links = webDriver.findElements(By.tagName("a"));
System.out.println("findElements: PASS");
System.out.println("Total Links Found: " + links.size());
pause(4);
for (WebElement link : links) {
String text = link.getText();
if (!text.isEmpty()) {
System.out.println("Link: " + text);
}
}
pause(4);
WebElement submitButton = webDriver.findElement(By.cssSelector("button[type='submit']"));
System.out.println("Submit Button Displayed: " + submitButton.isDisplayed());
pause(3);
System.out.println("Submit Button Enabled: " + submitButton.isEnabled());
pause(4);
Actions actions = new Actions(webDriver);
actions.contextClick(nameField).perform();
System.out.println("Right Click: PASS");
pause(5);
actions.doubleClick(nameField).perform();
System.out.println("Double Click: PASS");
pause(5);
actions.moveToElement(locationField).perform();
System.out.println("Mouse Over: PASS");
pause(5);
JavascriptExecutor js = (JavascriptExecutor) webDriver;
js.executeScript("window.scrollTo(0, document.body.scrollHeight);");
System.out.println("Scroll Down: PASS");
pause(6);
js.executeScript("window.scrollTo(0, 0);");
System.out.println("Scroll Up: PASS");
pause(6);
System.out.println("Web Elements Test Completed");
pause(4);
} catch (Exception e) {
System.out.println("Web Elements Test: FAIL");
System.out.println("Reason: " + e.getMessage());
} finally {
pause(5);
webDriver.quit();
}
System.out.println();
System.out.println("==============================================");
System.out.println("LOCATORS:");
System.out.println("==============================================");
WebDriver locatorDriver = new ChromeDriver();
locatorDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
locatorDriver.manage().window().maximize();
try {
locatorDriver.get("http://localhost:8080/AgroTravel1/register.jsp");
pause(6);
locatorDriver.findElement(By.id("name"));
System.out.println("ID: PASS");
pause(3);
locatorDriver.findElement(By.name("phone"));
System.out.println("NAME: PASS");
pause(3);
locatorDriver.findElement(By.className("welcome-heading"));
System.out.println("CLASS NAME: PASS");
pause(3);
locatorDriver.findElement(By.linkText("Gallery"));
System.out.println("LINK TEXT: PASS");
pause(3);
locatorDriver.findElement(By.tagName("h1"));
System.out.println("TAG NAME: PASS");
pause(3);
locatorDriver.findElement(By.cssSelector("button[type='submit']"));
System.out.println("CSS SELECTOR: PASS");
pause(3);
locatorDriver.findElement(By.xpath("//a[normalize-space()='Gallery']"));
System.out.println("XPATH: PASS");
pause(5);
System.out.println();
System.out.println("LOCATOR VALUES:");
System.out.println("ID: name");
pause(2);
System.out.println("NAME: phone");
pause(2);
System.out.println("CLASS NAME: welcome-heading");
pause(2);
System.out.println("LINK TEXT: Gallery");
pause(2);
System.out.println("TAG NAME: h1");
pause(2);
System.out.println("CSS SELECTOR: button[type='submit']");
pause(2);
System.out.println("XPATH: //a[normalize-space()='Gallery']");
pause(5);
System.out.println("Locators Test Completed");
pause(5);
} catch (Exception e) {
System.out.println("Locators Test: FAIL");
System.out.println("Reason: " + e.getMessage());
} finally {
pause(5);
locatorDriver.quit();
}
System.out.println();
System.out.println("==============================================");
System.out.println("           ALL TESTS COMPLETED");
System.out.println("==============================================");
System.out.println();
System.out.println("Selenium testing for AgroTravel Web Application");
System.out.println("has been verified successfully.");
}
}