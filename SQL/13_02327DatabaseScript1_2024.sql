USE Newspaper_Database;


DROP TABLE IF EXISTS Illustrates;
DROP TABLE IF EXISTS Photographer;
DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS Publishes;
DROP TABLE IF EXISTS ArticleEdition;
DROP TABLE IF EXISTS Edition;
DROP TABLE IF EXISTS Article;
DROP TABLE IF EXISTS Photo;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Journalist;
DROP TABLE IF EXISTS Newspaper;

CREATE TABLE Newspaper
(NewspaperTitle VARCHAR (100),
 FoundingDate DATE,
 Periodicity INT,
 PRIMARY KEY (NewspaperTitle)
); 

CREATE TABLE Journalist 
	(CPR 			VARCHAR(10) NOT NULL,
     FirstName  	VARCHAR(25),
     LastName   	VARCHAR(50),
     StreetName 	VARCHAR(100),
     CivicNumber 	INT,
     City		 	VARCHAR(30),
     ZipCode	 	INT,
     Country	 	VARCHAR(30),
     Telephone 		INT,
     Email 	   		VARCHAR(50),
     PRIMARY KEY(CPR)
	);
    
    
CREATE TABLE Article
    (ArticleTitle   VARCHAR(100) NOT NULL UNIQUE,
     Content        VARCHAR(10000),
     Topic          VARCHAR(50),
     ReadCount      INT,

     PRIMARY KEY(ArticleTitle)
    );
    
CREATE TABLE Role (
     ArticleTitle VARCHAR(100),
	 CPR CHAR(10),
     RoleType ENUM('Leader', 'Advisor', 'Writer'),
     PRIMARY KEY (ArticleTitle, CPR),
	 FOREIGN KEY (CPR) REFERENCES Journalist(CPR) ON DELETE CASCADE,
	 FOREIGN KEY (ArticleTitle) REFERENCES Article(ArticleTitle) ON DELETE CASCADE
	);

CREATE TABLE Photo (
	PhotoTitle VARCHAR(255),
	DateTaken DATE,
	CPR CHAR(10),
	PRIMARY KEY (PhotoTitle),
	FOREIGN KEY (CPR) REFERENCES Journalist (CPR) ON DELETE SET NULL
);



CREATE TABLE Illustrates 
	(PhotoTitle		VARCHAR(100),
     ArticleTitle	VARCHAR(100),
     PRIMARY KEY(PhotoTitle, ArticleTitle),
     FOREIGN KEY(PhotoTitle) REFERENCES Photo(PhotoTitle) ON DELETE CASCADE,
     FOREIGN KEY(ArticleTitle) REFERENCES Article(ArticleTitle) ON DELETE CASCADE
     );
     
CREATE TABLE Photographer
	(PhotoTitle		VARCHAR(100),
	 CPR			CHAR(10),
     PRIMARY KEY(PhotoTitle, CPR),
     FOREIGN KEY(PhotoTitle) REFERENCES Photo(PhotoTitle) ON DELETE CASCADE,
     FOREIGN KEY(CPR) REFERENCES Journalist(CPR) ON DELETE CASCADE
     );
	
CREATE TABLE Edition(
	NewspaperTitle VARCHAR(100), 
	PublishDate DATE NOT NULL UNIQUE,
	CPR CHAR(10),
    PRIMARY KEY(NewspaperTitle, PublishDate),
    FOREIGN KEY(NewspaperTitle) REFERENCES Newspaper(NewspaperTitle) ON DELETE CASCADE,
	FOREIGN KEY(CPR) REFERENCES Journalist(CPR) ON DELETE SET NULL
);

CREATE TABLE ArticleEdition(
	NewspaperTitle VARCHAR(100),
	PublishDate 	DATE,
    ArticleTitle 	VARCHAR(100),
    PRIMARY KEY(NewspaperTitle, PublishDate, ArticleTitle),
    FOREIGN KEY(NewspaperTitle) REFERENCES Edition(NewspaperTitle) ON DELETE CASCADE,
    FOREIGN KEY(PublishDate) REFERENCES Edition(PublishDate) ON DELETE CASCADE,
    FOREIGN KEY(ArticleTitle) REFERENCES Article(ArticleTitle) ON DELETE CASCADE
);

CREATE TABLE Employee(
	NewspaperTitle VARCHAR(100),
	CPR CHAR(10),
    PRIMARY KEY(NewspaperTitle, CPR),
	FOREIGN KEY (NewspaperTitle) REFERENCES Newspaper (NewspaperTitle) ON DELETE CASCADE,
	FOREIGN KEY (CPR) REFERENCES Journalist (CPR) ON DELETE CASCADE
);

USE Newspaper_Database;


INSERT Journalist VALUES
('1307923123', 'Janik', 'High', 'Rynkebyvej', 65, 'Snedsted', 7752, 'Denmark', 20810350, 'lauritseovergaard@dayrep.com'),
('1510770230', 'Filippa', 'T. Knudsen', 'Slude Strand', 21, 'København', 2100, 'USA', 42331263, 'filippatknudsen@rhyta.com'),
('0101010101', 'Gustav', 'Løs', 'Reventlowsgade', 14, 'København', 2100, 'Denmark', 42069137, 'gustavloose@gmail.com'),
('2103980773', 'Michal', 'Hunt', 'Charming Street', 100, 'Amsterdam', 1011, 'Netherlands', 11223344, 'michalhunt@gmail.com'),
('1107049300', 'Sharon ', 'T. Higgins', 'Ørbækvej', 70, 'Frederiksberg C', 1810, 'Denmark', 60505585, 'sharonthiggins@jourrapide.com'),
('0703980773', 'George', 'Svinger', 'Strandvejen', 42, 'København', 2100, 'Denmark', 88776655, 'georgesvinger@gmail.com'),
('0509891311', 'Ausonio', 'Onio', 'Peberhaven', 16, 'Herlev', 2730, 'Denmark', 26978355, 'ausonioonio@teleworm.us'),
('1406960653', 'Billy', 'Bauman', 'Strandvejen', 65, 'København', 2100, 'Denmark', 27649582, 'billybauerman@gmail.com'),
('1903693489', 'Ben', 'Dover', 'Osebergvej', 20, 'Ølstykke', 3650, 'Denmark', 34782639, 'bendover@gmail.com'),
('1403018933', 'William', 'A. Nielsen', 'Møllevænget', 77, 'Valby', 2500, 'Sweden', 23711826, 'williamaxelsson@teleworm.us');

SELECT * FROM Journalist;

INSERT Newspaper VALUES
('Copenhagen News', '1952-12-30', 1),
('Nordic Weekends', '1980-09-10', 7),
('Sunday Morning', '1942-04-20', 7),
('Nordens Daily Newspaper', '1899-07-13', 1);

SELECT * FROM Newspaper;
 
INSERT Employee VALUES
('Copenhagen News', '1307923123'),
('Copenhagen News', '1510770230'),
('Copenhagen News', '1406960653'),
('Nordic Weekends', '2103980773'),
('Nordic Weekends', '1903693489'),
('Sunday Morning', '0703980773'),
('Sunday Morning', '0509891311'),
('Nordens Daily Newspaper', '0101010101'),
('Nordens Daily Newspaper', '1107049300'),
('Nordens Daily Newspaper', '1403018933');

SELECT * FROM Employee;

INSERT Article VALUES
('Grueling Course comes with horrific conditions', 'In a remarkable display of grit and determination, Charlotte Hughes, a UK runner, has become the first woman to conquer the Sadistic Torture Race, a feat previously considered unattainable for female athletes. Facing a course designed to push participants to their breaking point, Hughes defied the odds and shattered gender barriers in the world of extreme endurance sports.', 'BreakingNews', 726),
('State of emergency declared after baltimore bridge collapsed into the water', 'Baltimore, Maryland - A state of emergency has been declared following the collapse of a bridge into the water, sending shockwaves through the city. The incident, which occurred in the heart of Baltimore, has sparked widespread concern and prompted urgent action from authorities. The collapse, which occurred suddenly and without warning, has raised questions about the structural integrity of infrastructure across the city. Emergency crews are on the scene, working tirelessly to assess the damage and ensure the safety of residents.', 'BreakingNews', 487),
('Revolutionizing Agriculture: How Vertical Farming is Reshaping Food Production', 'Vertical farming, once a concept relegated to science fiction, is now revolutionizing the agricultural landscape, offering a sustainable solution to food production challenges. This innovative approach involves growing crops in vertically stacked layers, often in controlled indoor environments. With the world\'s population steadily increasing and arable land becoming scarcer, vertical farming presents a promising alternative that maximizes space and resources while minimizing environmental impact.', 'Science', 17),
('Renewable Energy Revolution: Harnessing Solar Power for a Sustainable Future', 'Solar power, once considered a futuristic dream, is now leading a renewable energy revolution, providing a sustainable solution to the world\'s growing energy needs. This innovative approach involves capturing sunlight and converting it into electricity through photovoltaic panels or concentrated solar power systems. With concerns over climate change and dwindling fossil fuel reserves, solar energy offers a promising alternative that reduces carbon emissions and mitigates environmental degradation. As technology advances and economies of scale drive down costs, solar power is becoming increasingly accessible, empowering communities to harness clean, renewable energy for a brighter, more sustainable future.', 'Science', 32),
('Mental Health: Prioritizing Well-being in a Fast-Paced World', 'Mental health, often overlooked in the hustle and bustle of modern life, is gaining recognition as a critical aspect of overall well-being. This multifaceted subject encompasses the emotional, psychological, and social aspects of human health, influencing how individuals think, feel, and interact with the world around them.', 'Health', 625),
('Empowering Minds: The Transformative Power of Education', 'Education stands as the cornerstone of human progress, empowering individuals, shaping societies, and driving innovation. Across the globe, access to quality education is recognized as a fundamental human right and a powerful tool for socioeconomic development. From early childhood education to lifelong learning opportunities, the impact of education resonates far beyond the confines of the classroom.', 'Politics', 437),
('Facing the Climate Crisis: Urgent Action Needed to Combat Climate Change', 'The scientific consensus is clear: human activities, particularly the burning of fossil fuels and deforestation, are the primary drivers of climate change. Greenhouse gas emissions continue to soar, trapping heat in the Earth\'s atmosphere and causing temperatures to rise at an alarming rate. The consequences of inaction are dire, with the potential to exacerbate natural disasters, disrupt food and water supplies, and displace millions of people from their homes.', 'Politics', 344),
('Advancements in Medicine: Pioneering Innovations Transforming Healthcare', 'One area witnessing remarkable progress is personalized medicine, which tailors medical treatment to the individual characteristics of each patient. Through advancements in genomics, proteomics, and other fields of molecular biology, healthcare providers can now better predict, prevent, and treat diseases based on a person\'s unique genetic makeup and other factors. This personalized approach not only improves treatment outcomes but also minimizes side effects and enhances patient satisfaction.', 'Health', 677),
('Equality: Striving Towards a Fair and Just Society', 'Despite progress in recent decades, disparities persist in various aspects of life, including education, employment, healthcare, and representation in positions of power. Systemic discrimination and prejudice continue to marginalize certain groups, perpetuating cycles of inequality and hindering social and economic mobility.', 'Politics', 488),
('Navigating the Ethical Frontier: Ensuring Responsible AI Development', 'Artificial Intelligence AI is revolutionizing industries, from healthcare to finance, with its ability to analyze data, automate tasks, and make predictions with unprecedented accuracy. However, as AI technologies continue to advance, questions about their ethical implications and societal impacts loom large, raising concerns about privacy, bias, accountability, and the potential for job displacement.', 'Politics', 206),
('Urbanization: Navigating the Opportunities and Challenges of City Growth', 'Urbanization, the process of population concentration in cities, is a defining feature of the modern world. As rural populations migrate to urban centers in search of economic opportunities and better living standards, cities are experiencing unprecedented growth and transformation. While urbanization offers numerous benefits, including increased economic productivity, cultural exchange, and innovation, it also presents significant challenges, from overpopulation and inadequate infrastructure to environmental degradation and social inequality.', 'Politics', 98),
('Economic Resilience: Navigating Challenges and Embracing Opportunities', 'One of the key challenges facing the global economy is the ongoing recovery from the COVID-19 pandemic. While vaccination efforts have led to improvements in public health outcomes, the economic fallout from lockdowns, business closures, and job losses continues to reverberate. Governments and policymakers face the daunting task of supporting businesses, workers, and households while navigating the transition to a post-pandemic economy.', 'Politics', 920),
('Preserving Biodiversity: Nurturing Wildlife in a Changing World', 'Wildlife, the diverse array of species that inhabit our planet, plays a vital role in maintaining ecosystems, regulating natural processes, and enriching our lives in countless ways. From the majestic elephants of the savannah to the delicate butterflies of the rainforest, every species has its place in the intricate web of life. However, as human activities continue to exert pressure on natural habitats, wildlife faces unprecedented challenges, from habitat loss and fragmentation to climate change and poaching.', 'Science', 134),
('Protecting Privacy: Safeguarding Individual Rights in the Digital Age', 'One of the primary threats to privacy in the digital age is the pervasive collection and exploitation of personal data by corporations and governments. From social media platforms to e-commerce websites, companies collect vast amounts of information about individuals\' online activities, preferences, and behaviors, often without their knowledge or consent. This data is then used for targeted advertising, algorithmic decision-making, and other purposes, raising concerns about data privacy and individual autonomy.', 'Science', 111),
('Exploring the Final Frontier', 'One of the most significant endeavors in space exploration is the quest to understand the origins and evolution of the cosmos. By studying distant galaxies, cosmic phenomena, and the remnants of ancient stars, astronomers and astrophysicists seek to unravel the mysteries of the universe\'s birth and evolution. Through observations made by ground-based telescopes, space telescopes like the Hubble Space Telescope, and future observatories such as the James Webb Space Telescope, scientists hope to uncover the secrets of dark matter, dark energy, and the formation of galaxies, shedding light on the fundamental processes that have shaped the cosmos.', 'Science', 52),
('Embracing the Journey: Redefining Aging in the 21st Century', 'Aging, once viewed as a natural and inevitable decline, is undergoing a profound transformation in the 21st century. As life expectancy increases and societies age, the perception of aging is shifting from a period of decline to one of opportunity, growth, and vitality. With advancements in healthcare, technology, and lifestyle interventions, individuals are redefining what it means to grow older, embracing the journey of aging with optimism, resilience, and a sense of purpose.', 'Politics', 337),
('Unleashing Human Potential: The Power of Innovation in Shaping the Future', 'At its core, innovation is about unleashing human potential, harnessing creativity, and challenging the status quo to develop new ideas, technologies, and solutions to complex problems. Whether it\'s finding ways to combat climate change, address global health crises, or create inclusive and sustainable economies, innovation holds the key to unlocking a brighter future for all.', 'Science', 12),
('Redefining Work: Embracing Flexibility and Purpose in the Modern Era', 'One of the most significant shifts in the world of work is the rise of remote and flexible work arrangements. Enabled by digital technologies and connectivity, remote work allows individuals to perform their job duties from anywhere with an internet connection, freeing them from the constraints of traditional office environments. Remote work offers numerous benefits, including greater flexibility in managing work-life balance, reduced commuting time and expenses, and access to a broader talent pool for employers.', 'Politics', 83),
('Faith in Flux: Navigating the Dynamics of Religion in a Globalized World', 'Religion, a fundamental aspect of human culture and identity, continues to shape societies, worldviews, and individual lives in profound ways. As globalization accelerates and societies become increasingly interconnected, the dynamics of religion are undergoing a period of flux, characterized by diversity, complexity, and transformation. From the rise of religious pluralism to the challenges posed by secularization and religious extremism, the role of religion in the modern world is both multifaceted and deeply consequential.', 'Politics', 623),
('Navigating Political Turbulence: Building Resilient Democracies in Uncertain Times', 'At the heart of resilient democracies lies the principle of inclusivity, ensuring that all voices are heard, and all citizens have equal opportunities to participate in the political process. By promoting civic engagement, protecting civil liberties, and fostering a culture of dialogue and cooperation, resilient democracies empower citizens to shape their collective destiny and hold their leaders accountable. Moreover, robust institutions, such as independent judiciaries, free press, and transparent electoral systems, are essential for safeguarding the rule of law and preventing the erosion of democratic norms and values.', 'Politics', 819);

SELECT * FROM Article;

INSERT Role VALUES
('Grueling Course comes with horrific conditions', '1307923123', 'Leader'),
('Grueling Course comes with horrific conditions', '1406960653', 'Writer'),
('State of emergency declared after baltimore bridge collapsed into the water', '1307923123', 'Leader'), 
('State of emergency declared after baltimore bridge collapsed into the water', '1406960653', 'Writer'),
('Revolutionizing Agriculture: How Vertical Farming is Reshaping Food Production', '1406960653', 'Leader'),
('Revolutionizing Agriculture: How Vertical Farming is Reshaping Food Production', '1307923123', 'Writer'),
('Renewable Energy Revolution: Harnessing Solar Power for a Sustainable Future', '1406960653', 'Leader'),
('Renewable Energy Revolution: Harnessing Solar Power for a Sustainable Future', '1307923123', 'Writer'),
('Mental Health: Prioritizing Well-being in a Fast-Paced World', '1307923123', 'Leader'),
('Mental Health: Prioritizing Well-being in a Fast-Paced World', '1406960653', 'Writer'),
('Empowering Minds: The Transformative Power of Education', '1307923123', 'Advisor'),
('Empowering Minds: The Transformative Power of Education', '1406960653', 'Writer'),
('Facing the Climate Crisis: Urgent Action Needed to Combat Climate Change', '1406960653', 'Advisor'),
('Facing the Climate Crisis: Urgent Action Needed to Combat Climate Change', '1307923123', 'Writer'),
('Advancements in Medicine: Pioneering Innovations Transforming Healthcare', '2103980773', 'Writer'),
('Equality: Striving Towards a Fair and Just Society', '2103980773', 'Writer'),
('Navigating the Ethical Frontier: Ensuring Responsible AI Development', '2103980773', 'Writer'),
('Urbanization: Navigating the Opportunities and Challenges of City Growth', '0703980773', 'Writer'),
('Economic Resilience: Navigating Challenges and Embracing Opportunities', '0703980773', 'Writer'),
('Preserving Biodiversity: Nurturing Wildlife in a Changing World',  '0703980773', 'Writer'),
('Protecting Privacy: Safeguarding Individual Rights in the Digital Age', '0101010101', 'Leader'),
('Protecting Privacy: Safeguarding Individual Rights in the Digital Age', '1403018933', 'Writer'),
('Exploring the Final Frontier', '0101010101', 'Leader'),
('Exploring the Final Frontier', '1403018933', 'Writer'),
('Embracing the Journey: Redefining Aging in the 21st Century', '1403018933', 'Leader'), 
('Embracing the Journey: Redefining Aging in the 21st Century', '0101010101', 'Advisor'), 
('Unleashing Human Potential: The Power of Innovation in Shaping the Future', '1403018933', 'Leader'), 
('Unleashing Human Potential: The Power of Innovation in Shaping the Future', '0101010101', 'Advisor'), 
('Redefining Work: Embracing Flexibility and Purpose in the Modern Era', '0101010101', 'Advisor'), 
('Redefining Work: Embracing Flexibility and Purpose in the Modern Era', '1403018933', 'Writer'), 
('Faith in Flux: Navigating the Dynamics of Religion in a Globalized World', '0101010101', 'Advisor'), 
('Faith in Flux: Navigating the Dynamics of Religion in a Globalized World', '1403018933', 'Writer'), 
('Navigating Political Turbulence: Building Resilient Democracies in Uncertain Times', '1403018933', 'Advisor'), 
('Navigating Political Turbulence: Building Resilient Democracies in Uncertain Times', '0101010101', 'Writer');

SELECT * FROM Role;


INSERT Edition VALUES
('Copenhagen News', '2024-02-14', '1510770230'),
('Copenhagen News', '2024-02-13', '1510770230'),
('Copenhagen News', '2024-02-12', '1510770230'),
('Nordic Weekends', '2024-02-10', '1903693489'),
('Sunday Morning', '2024-02-04', '0509891311'),
('Nordens Daily Newspaper', '2024-02-02', '1107049300'),
('Nordens Daily Newspaper', '2024-02-01', '1107049300');

SELECT * FROM Edition;

INSERT ArticleEdition VALUES
('Copenhagen News', '2024-02-14', 'Grueling Course comes with horrific conditions'),
('Copenhagen News', '2024-02-14', 'State of emergency declared after baltimore bridge collapsed into the water'),
('Copenhagen News', '2024-02-14', 'Revolutionizing Agriculture: How Vertical Farming is Reshaping Food Production'),
('Copenhagen News', '2024-02-13', 'Renewable Energy Revolution: Harnessing Solar Power for a Sustainable Future'),
('Copenhagen News', '2024-02-13', 'Mental Health: Prioritizing Well-being in a Fast-Paced World'),
('Copenhagen News', '2024-02-12', 'Empowering Minds: The Transformative Power of Education'),
('Copenhagen News', '2024-02-12', 'Facing the Climate Crisis: Urgent Action Needed to Combat Climate Change'),
('Nordic Weekends', '2024-02-10', 'Advancements in Medicine: Pioneering Innovations Transforming Healthcare'),
('Nordic Weekends', '2024-02-10', 'Equality: Striving Towards a Fair and Just Society'),
('Nordic Weekends', '2024-02-10', 'Navigating the Ethical Frontier: Ensuring Responsible AI Development'),
('Sunday Morning', '2024-02-04', 'Urbanization: Navigating the Opportunities and Challenges of City Growth'),
('Sunday Morning', '2024-02-04', 'Economic Resilience: Navigating Challenges and Embracing Opportunities'),
('Sunday Morning', '2024-02-04', 'Preserving Biodiversity: Nurturing Wildlife in a Changing World'),
('Nordens Daily Newspaper', '2024-02-02', 'Protecting Privacy: Safeguarding Individual Rights in the Digital Age'),
('Nordens Daily Newspaper', '2024-02-02', 'Exploring the Final Frontier'),
('Nordens Daily Newspaper', '2024-02-02', 'Embracing the Journey: Redefining Aging in the 21st Century'),
('Nordens Daily Newspaper', '2024-02-01', 'Unleashing Human Potential: The Power of Innovation in Shaping the Future'),
('Nordens Daily Newspaper', '2024-02-01', 'Redefining Work: Embracing Flexibility and Purpose in the Modern Era'),
('Nordens Daily Newspaper', '2024-02-01', 'Faith in Flux: Navigating the Dynamics of Religion in a Globalized World'),
('Nordens Daily Newspaper', '2024-02-01', 'Navigating Political Turbulence: Building Resilient Democracies in Uncertain Times');

SELECT * FROM ArticleEdition;

INSERT Photo VALUES 
('Charlotte Hughes running at the Sadistic Torture Race', '2023-12-19', '1403018933'),
('Aftermath of baltimore bridge collapsing', '2023-10-25', '1903693489'),
('Vertical farms in a large greenhouse', '2024-01-03', '1406960653'),
('Solar array in desert', '2024-01-20', '1403018933'),
('Sad person', '2024-01-09', '1403018933'),
('Classroom', '2023-12-27', '1903693489'),
('Coal power plant', '2023-12-22', '1406960653'),
('Pharmaceutical scientist in lab', '2023-11-29', '1903693489'),
('People rallying for equality', '2023-12-06', '1403018933'),
('Server farm', '2023-11-15', '1406960653'),
('Suburbs', '2023-11-22', '1903693489'),
('Closed businesses', '2023-12-15', '1406960653'),
('Wildlife in the rainforest', '2023-10-23', '1406960653'),
('Hacker in front of computer', '2023-11-10', '1403018933'),
('Rocket at NASA', '2024-01-24', '1903693489'),
('Old people running', '2023-11-01', '1403018933'),
('Ted talk about human potential', '2024-01-17', '1406960653'),
('Man working from laptop', '2023-11-08', '1406960653'),
('People praying', '2023-12-13', '1403018933'),
('People in congress', '2023-10-18', '1903693489');
       
SELECT * FROM Photo;

INSERT Photographer VALUES 
('Charlotte Hughes running at the Sadistic Torture Race', '1403018933'),
('Aftermath of baltimore bridge collapsing', '1903693489'),
('Vertical farms in a large greenhouse', '1406960653'),
('Solar array in desert', '1403018933'),
('Sad person', '1403018933'),
('Classroom', '1903693489'),
('Coal power plant', '1406960653'),
('Pharmaceutical scientist in lab', '1903693489'),
('People rallying for equality', '1403018933'),
('Server farm', '1406960653'),
('Suburbs', '1903693489'),
('Closed businesses', '1406960653'),
('Wildlife in the rainforest', '1406960653'),
('Hacker in front of computer', '1403018933'),
('Rocket at NASA', '1903693489'),
('Old people running', '1403018933'),
('Ted talk about human potential', '1406960653'),
('Man working from laptop', '1406960653'),
('People praying', '1403018933'),
('People in congress', '1903693489');
       
SELECT * FROM Photographer;

INSERT Illustrates VALUES 
('Charlotte Hughes running at the Sadistic Torture Race', 'Grueling Course comes with horrific conditions'),
('Aftermath of baltimore bridge collapsing', 'State of emergency declared after baltimore bridge collapsed into the water'),
('Vertical farms in a large greenhouse', 'Revolutionizing Agriculture: How Vertical Farming is Reshaping Food Production'),
('Solar array in desert', 'Renewable Energy Revolution: Harnessing Solar Power for a Sustainable Future'),
('Sad person', 'Mental Health: Prioritizing Well-being in a Fast-Paced World'),
('Classroom', 'Empowering Minds: The Transformative Power of Education'),
('Coal power plant', 'Facing the Climate Crisis: Urgent Action Needed to Combat Climate Change'),
('Pharmaceutical scientist in lab', 'Advancements in Medicine: Pioneering Innovations Transforming Healthcare'),
('People rallying for equality', 'Equality: Striving Towards a Fair and Just Society'),
('Server farm', 'Navigating the Ethical Frontier: Ensuring Responsible AI Development'),
('Suburbs', 'Urbanization: Navigating the Opportunities and Challenges of City Growth'),
('Closed businesses', 'Economic Resilience: Navigating Challenges and Embracing Opportunities'),
('Wildlife in the rainforest', 'Preserving Biodiversity: Nurturing Wildlife in a Changing World'),
('Hacker in front of computer', 'Protecting Privacy: Safeguarding Individual Rights in the Digital Age'),
('Rocket at NASA', 'Exploring the Final Frontier'),
('Old people running', 'Embracing the Journey: Redefining Aging in the 21st Century'),
('Ted talk about human potential', 'Unleashing Human Potential: The Power of Innovation in Shaping the Future'),
('Man working from laptop', 'Redefining Work: Embracing Flexibility and Purpose in the Modern Era'),
('People praying', 'Faith in Flux: Navigating the Dynamics of Religion in a Globalized World'),
('People in congress', 'Navigating Political Turbulence: Building Resilient Democracies in Uncertain Times');

SELECT * FROM Illustrates;



