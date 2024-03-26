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
('Grueling Course comes with horrific conditions', 'In a remarkable display of grit and determination, Charlotte Hughes, a UK runner, has become the first woman to conquer the Sadistic Torture Race, a feat previously considered unattainable for female athletes. Facing a course designed to push participants to their breaking point, Hughes defied the odds and shattered gender barriers in the world of extreme endurance sports.', 'Sport', 726, '1307923123'),
('State of emergency declared after baltimore bridge collapsed into the water', 'Baltimore, Maryland - A state of emergency has been declared following the collapse of a bridge into the water, sending shockwaves through the city. The incident, which occurred in the heart of Baltimore, has sparked widespread concern and prompted urgent action from authorities. The collapse, which occurred suddenly and without warning, has raised questions about the structural integrity of infrastructure across the city. Emergency crews are on the scene, working tirelessly to assess the damage and ensure the safety of residents.', 'Current Events', 487, '1510770230'),
('Revolutionizing Agriculture: How Vertical Farming is Reshaping Food Production', 'Vertical farming, once a concept relegated to science fiction, is now revolutionizing the agricultural landscape, offering a sustainable solution to food production challenges. This innovative approach involves growing crops in vertically stacked layers, often in controlled indoor environments. With the world\'s population steadily increasing and arable land becoming scarcer, vertical farming presents a promising alternative that maximizes space and resources while minimizing environmental impact.', 'Science', 573, '0101010101'),
('Renewable Energy Revolution: Harnessing Solar Power for a Sustainable Future', 'Solar power, once considered a futuristic dream, is now leading a renewable energy revolution, providing a sustainable solution to the world\'s growing energy needs. This innovative approach involves capturing sunlight and converting it into electricity through photovoltaic panels or concentrated solar power systems. With concerns over climate change and dwindling fossil fuel reserves, solar energy offers a promising alternative that reduces carbon emissions and mitigates environmental degradation. As technology advances and economies of scale drive down costs, solar power is becoming increasingly accessible, empowering communities to harness clean, renewable energy for a brighter, more sustainable future.', 'Science', 287, '2103980773'),
('Mental Health: Prioritizing Well-being in a Fast-Paced World', 'Mental health, often overlooked in the hustle and bustle of modern life, is gaining recognition as a critical aspect of overall well-being. This multifaceted subject encompasses the emotional, psychological, and social aspects of human health, influencing how individuals think, feel, and interact with the world around them.', 'Health', 625, '1107049300'),
('Empowering Minds: The Transformative Power of Education', 'Education stands as the cornerstone of human progress, empowering individuals, shaping societies, and driving innovation. Across the globe, access to quality education is recognized as a fundamental human right and a powerful tool for socioeconomic development. From early childhood education to lifelong learning opportunities, the impact of education resonates far beyond the confines of the classroom.', 'Education', 437, '0703980773'),
('Facing the Climate Crisis: Urgent Action Needed to Combat Climate Change', 'The scientific consensus is clear: human activities, particularly the burning of fossil fuels and deforestation, are the primary drivers of climate change. Greenhouse gas emissions continue to soar, trapping heat in the Earth\'s atmosphere and causing temperatures to rise at an alarming rate. The consequences of inaction are dire, with the potential to exacerbate natural disasters, disrupt food and water supplies, and displace millions of people from their homes.', 'Climate Chanage', 344, '0509891311'),
('Advancements in Medicine: Pioneering Innovations Transforming Healthcare', 'One area witnessing remarkable progress is personalized medicine, which tailors medical treatment to the individual characteristics of each patient. Through advancements in genomics, proteomics, and other fields of molecular biology, healthcare providers can now better predict, prevent, and treat diseases based on a person\'s unique genetic makeup and other factors. This personalized approach not only improves treatment outcomes but also minimizes side effects and enhances patient satisfaction.', 'Medicine', 677, '1307923123'),
('Equality: Striving Towards a Fair and Just Society', 'Despite progress in recent decades, disparities persist in various aspects of life, including education, employment, healthcare, and representation in positions of power. Systemic discrimination and prejudice continue to marginalize certain groups, perpetuating cycles of inequality and hindering social and economic mobility.', 'Equaality', 488, '1510770230'),
('Navigating the Ethical Frontier: Ensuring Responsible AI Development', 'Artificial Intelligence AI is revolutionizing industries, from healthcare to finance, with its ability to analyze data, automate tasks, and make predictions with unprecedented accuracy. However, as AI technologies continue to advance, questions about their ethical implications and societal impacts loom large, raising concerns about privacy, bias, accountability, and the potential for job displacement.', 'AI Ethics', 206, '0101010101'),
('Urbanization: Navigating the Opportunities and Challenges of City Growth', 'Urbanization, the process of population concentration in cities, is a defining feature of the modern world. As rural populations migrate to urban centers in search of economic opportunities and better living standards, cities are experiencing unprecedented growth and transformation. While urbanization offers numerous benefits, including increased economic productivity, cultural exchange, and innovation, it also presents significant challenges, from overpopulation and inadequate infrastructure to environmental degradation and social inequality.', 'Urbanization', 98, '2103980773'),
('Economic Resilience: Navigating Challenges and Embracing Opportunities', 'One of the key challenges facing the global economy is the ongoing recovery from the COVID-19 pandemic. While vaccination efforts have led to improvements in public health outcomes, the economic fallout from lockdowns, business closures, and job losses continues to reverberate. Governments and policymakers face the daunting task of supporting businesses, workers, and households while navigating the transition to a post-pandemic economy.', 'Economy', 920, '1107049300'),
('Preserving Biodiversity: Nurturing Wildlife in a Changing World', 'Wildlife, the diverse array of species that inhabit our planet, plays a vital role in maintaining ecosystems, regulating natural processes, and enriching our lives in countless ways. From the majestic elephants of the savannah to the delicate butterflies of the rainforest, every species has its place in the intricate web of life. However, as human activities continue to exert pressure on natural habitats, wildlife faces unprecedented challenges, from habitat loss and fragmentation to climate change and poaching.', 'Wildlife', 134, '0703980773'),
('Protecting Privacy: Safeguarding Individual Rights in the Digital Age', 'One of the primary threats to privacy in the digital age is the pervasive collection and exploitation of personal data by corporations and governments. From social media platforms to e-commerce websites, companies collect vast amounts of information about individuals\' online activities, preferences, and behaviors, often without their knowledge or consent. This data is then used for targeted advertising, algorithmic decision-making, and other purposes, raising concerns about data privacy and individual autonomy.', 'Privacy', 587, '0509891311'),
('Exploring the Final Frontier', 'One of the most significant endeavors in space exploration is the quest to understand the origins and evolution of the cosmos. By studying distant galaxies, cosmic phenomena, and the remnants of ancient stars, astronomers and astrophysicists seek to unravel the mysteries of the universe\'s birth and evolution. Through observations made by ground-based telescopes, space telescopes like the Hubble Space Telescope, and future observatories such as the James Webb Space Telescope, scientists hope to uncover the secrets of dark matter, dark energy, and the formation of galaxies, shedding light on the fundamental processes that have shaped the cosmos.', 'Space', 744, '1307923123'),
('Embracing the Journey: Redefining Aging in the 21st Century', 'Aging, once viewed as a natural and inevitable decline, is undergoing a profound transformation in the 21st century. As life expectancy increases and societies age, the perception of aging is shifting from a period of decline to one of opportunity, growth, and vitality. With advancements in healthcare, technology, and lifestyle interventions, individuals are redefining what it means to grow older, embracing the journey of aging with optimism, resilience, and a sense of purpose.', 'Aging', 337, '1510770230'),
('Unleashing Human Potential: The Power of Innovation in Shaping the Future', 'At its core, innovation is about unleashing human potential, harnessing creativity, and challenging the status quo to develop new ideas, technologies, and solutions to complex problems. Whether it\'s finding ways to combat climate change, address global health crises, or create inclusive and sustainable economies, innovation holds the key to unlocking a brighter future for all.', 'Innovation', 12, '0101010101'),
('Redefining Work: Embracing Flexibility and Purpose in the Modern Era', 'One of the most significant shifts in the world of work is the rise of remote and flexible work arrangements. Enabled by digital technologies and connectivity, remote work allows individuals to perform their job duties from anywhere with an internet connection, freeing them from the constraints of traditional office environments. Remote work offers numerous benefits, including greater flexibility in managing work-life balance, reduced commuting time and expenses, and access to a broader talent pool for employers.', 'Work', 83, '2103980773'),
('Faith in Flux: Navigating the Dynamics of Religion in a Globalized World', 'Religion, a fundamental aspect of human culture and identity, continues to shape societies, worldviews, and individual lives in profound ways. As globalization accelerates and societies become increasingly interconnected, the dynamics of religion are undergoing a period of flux, characterized by diversity, complexity, and transformation. From the rise of religious pluralism to the challenges posed by secularization and religious extremism, the role of religion in the modern world is both multifaceted and deeply consequential.', 'Religion', 623, '1107049300'),
('Navigating Political Turbulence: Building Resilient Democracies in Uncertain Times', 'At the heart of resilient democracies lies the principle of inclusivity, ensuring that all voices are heard, and all citizens have equal opportunities to participate in the political process. By promoting civic engagement, protecting civil liberties, and fostering a culture of dialogue and cooperation, resilient democracies empower citizens to shape their collective destiny and hold their leaders accountable. Moreover, robust institutions, such as independent judiciaries, free press, and transparent electoral systems, are essential for safeguarding the rule of law and preventing the erosion of democratic norms and values.', 'Politics', 819, '0703980773');

SELECT * FROM Article;

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
('2024-02-14', 'Grueling Course comes with horrific conditions'),
('2024-02-14', 'State of emergency declared after baltimore bridge collapsed into the water'),
('2024-02-14', 'Revolutionizing Agriculture: How Vertical Farming is Reshaping Food Production'),
('2024-02-13', 'Renewable Energy Revolution: Harnessing Solar Power for a Sustainable Future'),
('2024-02-13', 'Mental Health: Prioritizing Well-being in a Fast-Paced World'),
('2024-02-12', 'Empowering Minds: The Transformative Power of Education'),
('2024-02-12', 'Facing the Climate Crisis: Urgent Action Needed to Combat Climate Change'),
('2024-02-10', 'Advancements in Medicine: Pioneering Innovations Transforming Healthcare'),
('2024-02-10', 'Equality: Striving Towards a Fair and Just Society'),
('2024-02-10', 'Navigating the Ethical Frontier: Ensuring Responsible AI Development'),
('2024-02-04', 'Urbanization: Navigating the Opportunities and Challenges of City Growth'),
('2024-02-04', 'Economic Resilience: Navigating Challenges and Embracing Opportunities'),
('2024-02-04', 'Preserving Biodiversity: Nurturing Wildlife in a Changing World'),
('2024-02-02', 'Protecting Privacy: Safeguarding Individual Rights in the Digital Age'),
('2024-02-02', 'Exploring the Final Frontier'),
('2024-02-02', 'Embracing the Journey: Redefining Aging in the 21st Century'),
('2024-02-01', 'Unleashing Human Potential: The Power of Innovation in Shaping the Future'),
('2024-02-01', 'Redefining Work: Embracing Flexibility and Purpose in the Modern Era'),
('2024-02-01', 'Faith in Flux: Navigating the Dynamics of Religion in a Globalized World'),
('2024-02-01', 'Navigating Political Turbulence: Building Resilient Democracies in Uncertain Times');

SELECT * FROM ArticleEdition;

